# Kakaw

Kakaw is a set of extensions to Cocoa (mainly AppKit) that aims to make OSX UI development easier and faster.

If you are using Kakaw in your project,  [let me know](https://twitter.com/Lejdborg). You're not obligated to, but it would make my day :)

Kakaw supports OSX 10.6+.

## Documentation

Kakaw is documented using the [AppleDoc](https://github.com/tomaz/appledoc) standard. You can generate a HTML docset with:

    ./gendoc

The documentation will be available in `Documentation/`.

## Installation

* Add Kakaw as a submodule to your project: `git submodule add git@github.com:Lejdborg/Kakaw.git Dependencies/Kakaw`
* Drag and drop Kakaw.xcodeproj into your application's Xcode project or workspace.
* On the "Build Phases" tab of your application target, add Kakaw to "Target Dependencies".
* Add Kakaw to the "Link Binary With Libraries" phase.
* Add Kakaw.framework to your "Copy Frameworks" build phase. If you don't already have one, simply add a "Copy Files" build phase and target the "Frameworks" destination.

## License

Copyright (c) 2013 Christoffer Lejdborg

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.