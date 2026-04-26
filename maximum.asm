# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	ask: .asciiz "Enter the next number:\n"
	newline: .asciiz "\n"
	max: .asciiz "Maximum: "

#Text Area (i.e. instructions/code directive)
.text
main:

        # TODO: Write your code here
    # You can have other labels expressed here, if you need to

	la $a0, ask
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $t0, $v0


	la $a0, ask
        li $v0, 4
        syscall

        li $v0, 5
        syscall
        move $t1, $v0


	la $a0, ask
        li $v0, 4
        syscall

        li $v0, 5
        syscall
        move $t2, $v0


start1:
	blt $t0, $zero, negative1
	j start2
negative1:
	nor $t0, $t0, $zero
	addiu $t0, $t0, 1
start2:
	blt $t1, $zero, negative2
	j start3
negative2:
	nor $t1, $t1, $zero
	addiu $t1, $t1, 1
start3:
        blt $t2, $zero, negative3	
	j finish
negative3:
	nor $t2, $t2, $zero
	addiu $t2, $t2, 1
finish:

	la $a0, max
	li $v0, 4
	syscall

	slt $t3, $t1, $t0
	slt $t4, $t2, $t0
	slt $t5, $t1, $t2

	and $t6, $t3, $t4

	nor $t9, $t3, $zero
	and $t7, $t9, $t5

	nor $t9, $t4, $zero
	and $t8, $t9, $t5

	bne $t6, $zero, res0
	bne $t7, $zero, res1
	bne $t8, $zero, res2
res0:
	li $v0, 1
	move $a0, $t0
	syscall
	j exit
res1:
        li $v0, 1
        move $a0, $t1
        syscall
        j exit
res2:
        li $v0, 1
        move $a0, $t2
        syscall
        j exit
exit:
	la $a0, newline
        li $v0, 4
        syscall
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
