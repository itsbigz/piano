# piano with assembly!
Part one: what is a keyboard (instrument)?
Keyboard instrument, any musical instrument on which different notes can be sounded by pressing a series of keys, push buttons, or parallel levers. In nearly all cases in Western music the keys correspond to consecutive notes in the chromatic scale, and they run from the bass at the left to the treble at the right. (1)

What is a Synthesizer?
A sound synthesizer is an electronic musical instrument that generates electric signals converted to sound through loudspeakers or headphones. Synthesizers may either imitate other instruments or generate new timbres. They are often played with a keyboard, but they can be controlled via a variety of other input devices, including music sequencers, instrument controllers, fingerboards, guitar synthesizers, wind controllers, and electronic drums. Synthesizers without built-in controllers are often called sound modules, and are controlled via MIDI or CV/Gate. Synthesizers use various methods to generate signal. (2)
 
Part two: My implementation of synthesizer:
I implemented my synthesizer in assembly 32 bits (nasm). To run the 32 bit code on my 64 bit system, I needed a virtual machine. I use bochs  v2.6.9.
What is bochs?
Bochs (pronounced "box") is a portable IA-32 and x86-64 IBM PC compatible emulator and debugger mostly written in C++ and distributed as free software under the GNU Lesser General Public License. It supports emulation of the processor(s) (including protected mode), memory, disks, display, Ethernet, BIOS and common hardware peripherals of PCs.
Many guest operating systems can be run using the emulator including DOS, several versions of Microsoft Windows, BSDs, Linux, Xenix and Rhapsody(precursor of Mac OS X). Bochs runs on many host operating systems, including Android, iOS, Linux, macOS, PlayStation 2, Windows, and Windows Mobile.
Bochs is mostly used for operating system development (when an emulated operating system crashes, it does not crash the host operating system, so the emulated OS can be debugged) and to run other guest operating systems inside already running host operating systems. It can also be used to run older software – such as PC games – which will not run on non-compatible, or too fast computers. (3)
To run the code in this emulator, I needed a basic operating system to run and start the system to run the codes. I implemented a simple operating system as a protected mode. (4)
In the kernel_start label, I implemented my synthesizer. 
After compiling the bootloader.asm, protectedmode.asm we will build an image file and use this image file to start our OS in the virtual machine. The starting system is a complete operating system working in 32 bit assembly.
The screen that is shown below in pic1 is 160*25 screen:
![Picture1](https://user-images.githubusercontent.com/15060300/158822780-6af6e075-662a-4fb7-979d-063a77789f2c.png)
Each pixel of this page is addressed by a register called gs, gs has offset from 0 to 3999. I can print character or print a pixel of a color. So I painted pic1, starting from a start point and paint the keys one after another. After that I put the letters of which note on the keys.
I also have labels for coloring each of the keys causing them to change color on key press.
After making the picture, I would call the read_char lable. In this part, I would read a key of my keyboard from port 60H (which is the keyboard port) with “in” operator. After that I check which key it was, change the color of that key, and play the frequency of that key and change the color back.
How does it play the frequency?
 That one is easy, just like reading from the keyboard, I have the port for my speaker, and with “out” operator I can send the frequency to that port. To play that frequency for a wanted time, I will loop on two register to delay some time to hear the sound of that note completely.
The assignment of keys is shown below in pic2:
![Picture2](https://user-images.githubusercontent.com/15060300/158822934-aee4f374-dc66-45ef-b1e2-96c31e327e10.png)
Ready melody
My implementation can play two ready melodies, a happy birthday song (pressing key ‘1’) and a Beethoven symphony called “fur ellise” (pressing key ‘2’) 
I have a counter for the notes of the song, and a list of notes and it would play the notes one by one.
Challenges:
I have no idea what are notes and how to play piano! I watched some videos on youtube to learn some about them (the most useful one is at (5) this link)
Second the limitation on jumps and conditional jumps. At some point the volume of the code was so large that the operating system would keep restarting. To fix that I commented some part of the code. So birthday song and fur ellise cannot be played at one run of the code and one should be commented. 

References:

(1): https://www.britannica.com/art/keyboard-instrument 
(2): https://en.wikipedia.org/wiki/Synthesizer
(3): https://en.wikipedia.org/wiki/Bochs
(4): http://www.brokenthorn.com/Resources/OSDev8.html
(5): https://www.youtube.com/watch?v=-DVy4uNbsXg 

