# AlDente 🍝
_MacOS menu bar tool to limit maximum charging percentage_

This is a modification of the original free software version of [AlDente](https://github.com/davidwernhart/AlDente/releases).
The following changes were made:
* Removed lots of unused code
* Moved sleep assertion code to the main app rather than the privileged helper
* Changed SMC key for charge limiting to CH0C since it changes both CH0B and CH0C
* Added discharging feature (using CH0J key)
* Both charging and discharging will only be initiated when the target level is 5% off
* When sleep is inhibited, clamshell sleep is also inhibited to prevent overcharging (thanks to code from [Amphetamine Enhancer](https://github.com/x74353/Amphetamine-Enhancer))
* Updated launch at login helper to be ARM native
* UI fixes
* Replaced icon with better one from @pedrocatalao
* Probably more that I forgot

Copyright(c) 2021 David Wernhart
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
