.section __TEXT,__text
.global _start

_start: 
  mov	X0, #1		// 1 = StdOut
	adr	X1, helloworld 	// string to print
	mov	X2, #14	    	// min length of our string
	mov	X16, #4		// Unix write system call
	svc	#0x80		// Call kernel to output the string

  // Setup the parameters to exit the program
  // and then call the kernel to do it.
	mov     X0, #0		// Use 0 return code
	mov     X16, #1		// System call number 1 terminates this program
	svc     #0x80		// Call kernel to terminate the program

helloworld:      .ascii  "Hello, World!\n"
