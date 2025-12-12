# RISC-V-single-cycle-processor
Reference Textbook: <br/>
`D.M. Harris and S. Harris, Digital Design and Computer Architecture, RISC-V Edition. Morgan 
Kaufmann, 2022. `<br/>

<img width="901" height="545" alt="image" src="https://github.com/user-attachments/assets/dfba86b0-a2d6-45bf-a376-9c7e9ca3630d" />
<br/>


## Instruction Set Summary <br/>
This processor implements a simplified subset of the RISC-V RV32I instruction set architecture.<br/>
The supported instructions are just for now:<br/>
- **R type Instructions**<br/>
Registor-to-registor operations such as,<br/>
ADD, SUB, AND, OR, XOR, SLL, SRL<br/>
- **I type Instructions**<br/>
Immediate-based arithmetic and logical operations such as,<br/>
ADDI, ANDI, ORI, XORI<br/>
