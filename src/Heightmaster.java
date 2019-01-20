import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JFileChooser;
import javax.swing.UIManager;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;


public class loader {
	public static void main(String [] args)
	{
		
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Exception f) {System.err.println("Error " + f.getMessage()); }
		
		FileNameExtensionFilter luaFilter = new FileNameExtensionFilter("Lua Table", "lua");
		FileNameExtensionFilter pngFilter = new FileNameExtensionFilter("png File", "png");
		
		
		JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
		jfc.setFileFilter(pngFilter);
		jfc.setDialogTitle("Open Heightmap Image");
		
		int returnValue = jfc.showOpenDialog(null);
		
		//String heightmapfile = "D:/Users/Joe/Pictures/Heightmap/NewHeightmap/HEIGHTMAPOUTPUT.png";
		//String materialmapfile = "D:/Users/Joe/Pictures/Heightmap/SandyMountain.png";
		//String outputfile = heightmapfile.substring(0, heightmapfile.length()-4).concat(".lua");
		String outputfile = null;
		
		File hmFile = null;
		File texFile = null;
		
		if (returnValue == JFileChooser.APPROVE_OPTION) {
			File selectedFile = jfc.getSelectedFile();
			hmFile = selectedFile;
		}
		
		JFileChooser hmFc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
		hmFc.setFileFilter(pngFilter);
		hmFc.setDialogTitle("Open Material Texture Image");
		
		int newreturnValue = hmFc.showOpenDialog(null);
		
		if (newreturnValue == JFileChooser.APPROVE_OPTION) {
			File newselectedFile = hmFc.getSelectedFile();
			//outputfile = newselectedFile.getPath().substring(0, newselectedFile.getPath().length()-4).concat(".lua");
			texFile = newselectedFile;
		}else{
			texFile = hmFile;
		}
		
		JFileChooser outfile = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
		
		outfile.setFileFilter(luaFilter);
		outfile.setDialogTitle("Save Heightmap table");
		
		int saveValue = outfile.showSaveDialog(null);
		
		if (saveValue == JFileChooser.APPROVE_OPTION) {
			File newoutputFile = outfile.getSelectedFile();
			outputfile = newoutputFile.getPath();
			
			BufferedImage img = null;
			BufferedImage matimage = null;
			try {
			    //img = ImageIO.read(new File(heightmapfile));
				img = ImageIO.read(hmFile);
			   // matimage = ImageIO.read(new File(materialmapfile));
				matimage = ImageIO.read(texFile);
			    
			} catch (IOException e) {
			}
			
			int width = img.getWidth();
			int height = img.getHeight();
			
			File output1 = new File(outputfile.concat(".lua"));
			if (!output1.exists()) {
				try {
					output1.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			FileWriter fw = null;
			
			try {
				fw = new FileWriter(output1.getAbsoluteFile());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			BufferedWriter bw = new BufferedWriter(fw);
			
			try {
				bw.write("h = {}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			for (int i=0; i<height; i++){
				
				try {
					bw.write("h[".concat(Integer.toString(i+1)).concat("]={"));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				for (int k=0; k<width; k++){
					int rgb = img.getRGB(i, k);
					Color tRGB = new Color(matimage.getRGB(i, k));
					int red = (rgb & 0x0000FF00)  >>> 8;
			
					String cellMaterial = String.valueOf(tRGB.getRed()) + "," + String.valueOf(tRGB.getGreen()) + "," + String.valueOf(tRGB.getBlue());
					
					
					if(k!=width-1){
						
						try {
							//bw.write(Integer.toString(red).concat(",{").concat(cellMaterial).concat("}},{"));
							bw.write("{" + Integer.toString(red) + "," + "{" + cellMaterial + "}},");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}else{
						try {
							//bw.write(Integer.toString(red).concat(",").concat(cellMaterial).concat("},{"));
							bw.write("{" + Integer.toString(red) + "," + "{" + cellMaterial + "}}");
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				
				try {
					bw.write("}");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			try {
				bw.write(" _G.Heightmap=h");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				bw.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		    try {
				bw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}


