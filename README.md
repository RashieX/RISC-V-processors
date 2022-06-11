# Single-cycle-Implementation-of-a-32-bit-RISC-V-processor
Designed the datapath and control unit for a single cycle processor (including instruction memory) which runs 2 unique set of instructions

## Instruction Set Architecture: 
 1. Immediate Type: Ex: li r1, constant -> Loads immediate signed value specified in the instruction to the register.
    >opcode: 111111
    
    >Instruction code format
  
      ![image](https://user-images.githubusercontent.com/62239145/173168699-0e88ff8b-3fe4-4494-8591-5fba8f32767f.png)
 
 2. R-Type: Ex: add r1, r2, r3 -> adds the contents of register r2 and r3 and stores the resultant value in r1.
    >opcode: 000000
    
    >Instruction code format 
 
      ![image](https://user-images.githubusercontent.com/62239145/173168709-5ca8c944-027b-4d97-90f3-085dc626b83c.png)


## Architecture: 
   
  ![image](https://user-images.githubusercontent.com/62239145/173169074-71627a32-42b7-4960-875e-1d8efc2b717f.png)
