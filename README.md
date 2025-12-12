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

## Reference <br/>
This project was developed with reference to and inspiration from the work of another GitHub repository.<br/>
While the overall design and implementation were carried out independently, certain structural ideas and design approaches were informed by the following open-source project:<br/>
- [govardhnn / RISC_V_Single_Cycle_Processor](https://github.com/govardhnn/RISC_V_Single_Cycle_Processor?tab=readme-ov-file)
