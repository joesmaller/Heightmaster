# Heightmaster
A Roblox Studio plugin that converts heightmaps into terrain.

The plugin also allows you to convert heightmaps which also have a texture map associated with it, which can then convert that texture into materials for the terrain.

The plugin uses two major components, a java heightmap to lua converter, and the plugin which converts the lua file to terrain.

## Plugin
You can download the plugin from [here](https://www.roblox.com/library/2768461796/Heightmaster).

## Java application
The Java application isn't neccesarry, and if you would like, you can always create your own method for converting the heightmap into lua. Heightmaster just converts the heightmaps into a lua file which looks like this:
```lua
h = {}
h[1] = {
	{160,{150,80,150}};
	{160,{150,80,150}};
  {160,{150,80,150}};
}

h[2] = {
	{160,{150,80,150}};
	{160,{150,80,150}};
	{160,{150,80,150}};
}

_G.Heightmap = h
```
## How to use
This assumes that you already have a heightmap, and an optional texture map.

First you will want to run the .jar program, it will give a prompt to load your heightmap (The first prompt), the second prompt will be to load the texture map, and the third is the location where you would like to save the new lua file.

You will then want to open up Studio and preferbly on a new place file, then click the 'Run Script' button (You can find this under Model > Advanced > Run Script), this will prompt you to load the lua file created by the converter.

Once you have loaded the lua file, you can now open the Heightmaster plugin, and now edit the settings (I will go into detail of what each setting does below). You can click the 'Visualize' button to see a very basic representation of what the terrain will look like dependent on what the current settings are. After everything has been set up, you can click the 'Generate' button to begin the terrain generation, this may take some time dependent on how large a heightmap you are using.

## Warnings
I have discovered that using a very large heightmap often will lead to you being unable to save that specific place file, or even being able to test it. As a result, it would be wise to keep the size of the heightmap relatively small.

## Plugin Settings

### Terrain Settings

#### Terrain Origin
This is a Vector3, which is the centre of the generated terrain.

#### Terrain Scale
This is a value between 0 - 250 which will amplify the terrain. The higher the scale, the taller the terrain. However when the terrain is taller it will often lead to being much more rough and more terraces, so a value of >120 is usually the best.

#### Terrain Smooth Depth
This is a value between 1 - 50, which will give the terrain within the depth a smoothed occupancy, otherwise it will have an occupancy of 1.

#### Remove Level 0
A bool value which when active, will not generate any terrain which is sitting at a depth of 0. (This could be useful if you wanted to generate some kind of floating islands).

#### Extra Material Depth
This currently doesn't do anything.

### Materials

#### Default Material
This is the name of the material that will be generated if the material mode is set to disabled.

#### Material Mode
This is the mode which to get the materials from the current texture map. It will usually try and find the material that matches the texture the best.

The options and what they do are as follows:
##### Disabled
This option will not generate materials from the texture map, and instead will just use the default material.

##### Roblox Default
This uses the material colors located under Workspace > Terrain > MaterialColors to find the closest material to the texture.

##### Enhanced
This instead uses the average color of the material's texture to get the color, this might be more accurate than Roblox Default.

##### Custom
This option lets you assign specific colors to materials in the 'Custom Materials' section of the plugin, and uses those colors to find the material.

### Subsurface Material Settings
These properties define the materials of under the surface (By default, 75% of the terrain will be rock).

#### Use Subsurface Material
A bool to enable or disable the generation of a subsurface material.

#### Subsurface Material
What material will be used under the surface.

#### Subsurface Height
A float that defines how high up the subsurface material will go.

### Water
These are the controls of how the water is generated.

#### Enable Water
Enables or disabled water.

#### Water Height
A 0 - 255 value of how high the water will generate.

#### Water Size
How big the water area will be (Heightmap Size * Water Size).

#### Use Subwater Material
Enable or disable the use of a material that is under the water. (Rather than just using the material from the texture map).

#### Subwater Material
What material will be used if Use Subwater Material is enabled.

#### Generate Seabed
This property will generate a layer of material under the water, to cap it.

#### Seabed Depth
This a value that controls how far down the seabed will go.

### Beach
The beach allows you to set a material to generate above and below the water height.

#### Enable Beach
Enable or disable beach generation.

#### Beach Height
How far above the water height will the beach generate.

#### Beach Depth
How far below the water height will the beach generate.

#### Beach Material
The material used by the beach.

### Allowed Materials
These bool values let you enable or disable specific materials for use in the material generation.

### Custom Materials
These settings allow you to define specific colors for use in the 'Custom' Material Mode.
