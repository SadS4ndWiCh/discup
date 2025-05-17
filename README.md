# 😶 discup

First things first: I'm sorry 😶

Second things second: Just a dumb script to setup the update of discord to linux.

## install

```
$ wget https://github.com/SadS4ndWiCh/discup/releases/latest/download/discup && chmod +x discup && sudo mv discup /usr/local/bin
```

## how to use

Just type the following command and ok. Simple as that.

```sh
$ sudo discup
```

## how it works

TL;DR
First it install the discord in `.tar.gz` compressed format, extract it and move the files to some specific directories.

But the steps are:

1. Removes all files from old version.
2. Download the new Discord version from `https://discord.com/api/download?platform=linux&format=tar.gz`.
3. Extract the compressed file.
4. Removes compressed file.
5. Move the folder to `/opt` directory.
6. Create a copy of Discord's desktop configuration from `/opt/Discord/discord.desktop` to `/usr/share/applications`.
7. Create a link of Discord's binary from `/opt/Discord/Discord` to `/usr/local/bin`.

The final folder structure:

```
/opt
|   /Discord
|   |---Discord
|   |---discord.desktop
/usr
|   /share
|   |   /applications
|   |   |---discord.desktop
|   /local
|   |   /bin
|   |   |---discord -> /opt/Discord/Discord
```

---

```
       ....             .       .x+=:.                                          
   .xH888888Hx.        @88>    z`    ^%                                         
 .H8888888888888:      %8P        .   <k              x.    .      .d``         
 888*"""?""*88888X      .       .@8Ned8"       .    .@88k  z88u    @8Ne.   .u   
'f     d8x.   ^%88k   .@88u   .@^%8888"   .udR88N  ~"8888 ^8888    %8888:u@88N  
'>    <88888X   '?8  ''888E` x88:  `)8b. <888'888k   8888  888R     `888I  888. 
 `:..:`888888>    8>   888E  8888N=*8888 9888 'Y"    8888  888R      888I  888I 
        `"*88     X    888E   %8"    R88 9888        8888  888R      888I  888I 
   .xHHhx.."      !    888E    @8Wou 9%  9888        8888 ,888B .  uW888L  888' 
  X88888888hx. ..!     888&  .888888P`   ?8888u../  "8888Y 8888"  '*88888Nu88P  
 !   "*888888888"      R888" `   ^"F      "8888P'    `Y"   'YP    ~ '88888F`    
        ^"***"`         ""                  "P'                      888 ^      
                                                                     *8E        
                                                                     '8>        
                                                                      "         
```
