
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
# Write your code here!
# Do not remove the prog label or write code above it!
#-----------------------------

    # -- Registers -- 
    #    a0: address of the first array element
    #    a1: array length
    #    a2: the number that we are searching 
    #    s0: final result / address
    #    t0: loop counter
    #    t1: array element value 

            add    s0, zero, zero
            add    t0, zero, zero
    
for_loop: 
            beq    t0, a1, exit_for_loop
            addi   t0, t0, 1           # increment counter by 1
            lw     t1, 0(a0)           # t1 = Memory[a0]
if:
            bne    t1, a2 , exit_if    # if t1 == a2 then
            add    s0, a0, zero        # save the new address to s0
exit_if: 
            addi   a0, a0, 4           # next array element address 
            j      for_loop
exit_for_loop:
    
done:
    addi a7, zero, 10 
    ecall
