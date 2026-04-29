# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	ask: .asciiz "Enter number:\n"
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
	j start2
start2:
	blt $t1, $zero, negative2
	j start3
negative2:
	nor $t1, $t1, $zero
	addiu $t1, $t1, 1
	j start3
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

	move $t6, $t0
	slt $t9, $t6, $t1
	beq $t9, $zero, skip1
	move $t6, $t1
skip1:
	slt $t9, $t6, $t2
	beq $t9, $zero, skip2
	move $t6, $t2
skip2:
	li $v0, 1
	move $a0, $t6
	syscall
	j exit
exit:
	la $a0, newline
        li $v0, 4
        syscall
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
