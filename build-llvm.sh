
 # Implementation of Shell Script to build LLVM
 
 # Implemented on Ubuntu 16.04
 
 
 #------------------------------------------------
 # Assumption: the script is executed in users home directory
 #------------------------------------------------ 

 #!/bin/sh                               

 # Download a source file 
  
   echo --------------------------------------
   
   echo "Downloading LLVM-3.8.1 sources"

   echo --------------------------------------
     

             wget -4 http://llvm.org/releases/3.8.1/llvm-3.8.1.src.tar.xz                # -4 is to force IPv4
 
             wget -4 http://llvm.org/releases/3.8.1/cfe-3.8.1.src.tar.xz

             wget -4 http://llvm.org/releases/3.8.1/compiler-rt-3.8.1.src.tar.xz

 

 # Extract the llvm, clang and compiler-rt

 echo ------------------------------------------
  
 echo"Extracting the llvm, clang,and compiler-rt"
    
 echo ------------------------------------------  

             tar xvf ./llvm-3.8.1.src.tar.xz     
                       
             tar xvf ./cfe-3.8.1.src.tar.xz

             tar xvf ./compiler-rt-3.8.1.src.tar.xz


 # Move clang and compiler-rt to specific location

 echo ---------------------------------------------

 echo"Moving clang and compiler-rt to specific location "

 echo ---------------------------------------------
  

               mv ~/llvm-3.8.1.src ~/llvm-3.8.1

               mv ~/cfe-3.8.1.src ~/clang && mv ~/clang ~/llvm-3.8.1/tools/
 
               mv ~/compiler-rt-3.8.1.src ~/compiler-rt && mv ~/compiler-rt ~/llvm-3.8.1/projects/ 

  
 # Configue the LLVM

 echo ------------------------------------------------

 echo"Configuring LLVM for X86"

 echo -----------------------------------------------

 

              cd ~/llvm-3.8.1/

              mkdir build

              cd build
     

              cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD="X86"

 # Build the LLVM

  echo -----------------
  
  echo "Build the LLVM"
 
  echo -----------------
              
                make -j `nproc`

