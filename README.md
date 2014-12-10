AlvinPhysics
============

AlvinPhysics is an Objective-C wrapper for [Chipmunk2D](https://github.com/slembcke/Chipmunk2D) that uses UIKit and mimics the SpriteKit architecture.

# Why another wrapper for Chipmunk2D?

Well, there are a few reasons why I needed to create AlvinPhysics. First, SpriteKit is available in iOS 7 or later. So, in order to lower the Deployment Target we have to say goodbye to SpriteKit. Second, the first result in Google for SKShapeNode was ["SKShapeNode, you are dead to me"](http://sartak.org/2014/03/skshapenode-you-are-dead-to-me.html) for quite some time. Now this is the second result :-). Even after the release of iOS 8 I was not satisfied with the SpriteKit workflow. And finally, it is not comfortable to mix SpriteKit and UIKit elements.

So, if you need to move away from SpriteKit and want to make a simple application based on UIKit, you should consider AlvinPhysics.

# Functionality

**AlvinPhysics is far from a complete library**. It does **not** expose the full Chipmunk2D functionality. It does **not** implement the full SpriteKit functionality. It is more like a good base to get you started with a Chipmunk2D + UIKit.

I will commit any future improvements to the code. If there is interest in the project I will do my best to provide support or incorporate updates.

# Performance

I saw somewhere in [StackOverflow](https://stackoverflow.com/) that it is **not** a good idea to use UIKit for a game if you are going to draw more than a couple dozen objects. I have not made exact measurements, but I am quite satisfied with the results in my game [Order: A Fun Brain Game](https://itunes.apple.com/us/app/order-a-fun-brain-game/id926198363?mt=8).

If you have any concrete results I would be happy to publish them.

# What do I need to get started?

### For a new project.

Just get this repo and modify the demo project.

### For an existing project.

1. Get [Chipmunk2D](https://github.com/slembcke/Chipmunk2D) and build the C and Objective-C static libraries as described in the documentation. **Alternatively**, you can use the libraries of Chipmunk2D 7.0.0 that I have built and that are present in this repo.
2. Add the AlvinPhysics source code to your project.
3. Build and run.

# License

What you see is what you get. You can use the source code for personal and commercial projects. Do not forget to add a good word if you like AlvinPhysics.
