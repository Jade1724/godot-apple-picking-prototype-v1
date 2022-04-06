# Apple thinning WebXR project

This project aims to build an interactive VR scene for players to practice apple thinning. The game will be exported as an WebXR and be able to play this using most of the VR headset that supports WebXR.

The base of the project was build by following the tutorial [How to make a VR game for WebXR with Godot](https://www.snopekgames.com/tutorial/2020/how-make-vr-game-webxr-godot). 

## Versions
The project is developed using Godot game engine with the following versions:

- Godot v3.4.3
- GLES2 (Less resource intensive than GLES3 to support Quest)
- Godot OpenXR Plugin 1.2.0

The hardware/OS used for the development are:

- Asus ROG STRIX G15
- Windows 10

## Build and Export

### Godot game engine

Download Godot game engine for your operating sysmtem. There are standard version and Mono version(C# support). Choose the standard version since this project uses GDScript and does not need to support C#.

- [Godot for Linux](https://godotengine.org/download/linux)
- [Godot for Windows](https://godotengine.org/download/windows)
- [Godot for macOS](https://godotengine.org/download/osx)

Clone this repository to your machine. Open Godot and select "Import
" and an Import Existing Project popup will ask you to select the file path. Locate and select the project.godot file and click "Import & Edit".

### OpenXR plugin

The repository does not track Godot plugin files (addons folder). OpenXR plugin which is used to develop the VR scene should be downloaded locally on your machine. Click Scene -> New Scene on the top-left of the Godot editor. In the new empty scene, switch to "AssetLib" tab by clicking the top-center menu. Search for "OpenXR Plugin" in the asset library and download it. It will ask you which files in the plugin to install. Leave it as default and click install. This may take for a few minutes. 

Once OpenXR plugin is installed successfully, a new folder `addons` will be created under the project folder. The .gitignore contains `addons/**` so the plugin will not be pushed to the repo.

### Project setting and Export Template

Next, in the Godot editor, click Project -> Export... and then click "Add" on the popup windown, select HTML5.

If you are using Godot version earlier than Godot 3.2.4-beta5, you need a custom templates to export the project compatible with WebXR. Download the following Debug and Release build and specify the path to them. If you are using a newer version of Godot, skip this step. 
| Godot version | Downloads | 
| --- | --- |
| Godot 3.2.3 | [Debug build](https://www.dropbox.com/s/q769fj6f88avtwa/godot.javascript.opt.debug.zip?dl=1), [Release build](https://www.dropbox.com/s/p5c1gmyq58fnq27/godot.javascript.opt.zip?dl=1) |
| Godot 3.2.4-beta4 | [Debug build](https://www.dropbox.com/s/4kou2nd5610paje/godot.javascript.opt.debug.zip?dl=1), [Release build](https://www.dropbox.com/s/y3emqzpadxzzkwt/godot.javascript.opt.zip?dl=1)|

See [the tutorial](https://www.snopekgames.com/tutorial/2020/how-make-vr-game-webxr-godot) Export section for the full details. 
_The required step for old version of Godot ends here_

Finally, copy the script below into the "Head Include" field.
```
<script src="https://cdn.jsdelivr.net/npm/webxr-polyfill@latest/build/webxr-polyfill.min.js"></script>
<script>
var polyfill = new WebXRPolyfill();
</script>
```

This Polyfill script will fill in holes in a web browser's WebXR support. It is not a mandatory, but it makes your app work on more web browsers.

Export the project to `build/webxr/index.html` in the project folder. You can export it outside the project if you wish. However, I added `build/**` to .gitignore so feel free to export it in the folder. 

## Running WebXR

To enter the VR scene, the runnable HTML file need to be served using HTTPS. To setup an HTTPS server on your machine, install browser-sync.

If you have NodeJS and NPM, install browser-sync by running the following command in Terminal (Linux/macOS) or Command prompt (Windows):

```
npm i -g browser-sync
```
Then go to the directory where you exported your WebXR app. If you have been following previous section of this docs, your project must be in `build/webxr` folder. Run the following command to start serving:

```
browser-sync start -s --https --no-open --port=5001
```

If the HTTPS server successfully start running, you will see the URLs (internal and external) to access the runnable project. 

### Locally using on the Desktop

If you have a PCVR headset, you can acces to your browser to run the WebXR app. 
Open your Chrome or Firefox browser and enter the URL shown in the terminal followed by `https://`. The local URL should be `https://localhost:5001`. **Ctrl+Shift+I** opens a Developer Tools of the browser and see messages on the console if you have print() statement in the project GDscript. 

If you don't have a PCVR and would like to debug straight on the Desktop, there ai a WebXR Emulator Extension for both [Chrome](https://chrome.google.com/webstore/detail/webxr-api-emulator/mjddjgeghkdijejnciaefnkjmkafnnje) and [Firefox](https://addons.mozilla.org/firefox/addon/webxr-api-emulator).


Once you download the extention, you will see "WebXR" tab in a Developer Tools. Clicking on and draggin the headset on the emulator can change the view of the camera. Controller button clicks can be simulated in the emulator as well. 

### Through Oculus Browser

Using a mobile headset such as Oculus Quest 2, use external URL provided by browser-sync server to access the WebXR app. Make sure your hosting machine and the headset is under the same network.

Put on your Oculus Quest 2, open the Oculus menu and local "Oculus Browser". On the browser, type the external URL followed by `https://`(should be a IP address). The browser may tell you it is unsecure to access but choose "Accept risks and advance". 

If you successfully reach to the app, you will see a VR scene on a browser and a button "Enter VR". Click the button by pointing to it and pull the trigger. It will switch to immersive mode and you should be in the VR scene. 
