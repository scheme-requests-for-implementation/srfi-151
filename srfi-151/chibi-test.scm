(import (scheme base) (srfi-151) (chibi test))
(test-group "bitwise"

  (test -1 (bitwise-not 0))
  (test 0 (bitwise-and #b0 #b1))
  (test 1 (bitwise-and #b1 #b1))
  (test 0 (bitwise-and #b1 #b10))
  (test #b10 (bitwise-and #b11 #b10))
  (test #b101 (bitwise-and #b101 #b111))
  (test #b111 (bitwise-and -1 #b111))
  (test #b110 (bitwise-and -2 #b111))
  (test 3769478 (bitwise-and -4290775858 1694076839))
  (test 1680869008 (bitwise-and -193073517 1689392892))
  (test -4294967295 (bitwise-ior 1 (- -1 #xffffffff)))
  (test -18446744073709551615 (bitwise-ior 1 (- -1 #xffffffffffffffff)))
  (test -4294967126 (bitwise-xor #b10101010 (- -1 #xffffffff)))
  (test (bitwise-not -4294967126) (bitwise-eqv #b10101010 (- -1 #xffffffff)))
  (test -18446744073709551446 (bitwise-xor #b10101010 (- -1 #xffffffffffffffff)))
  (test -2600468497 (bitwise-ior 1694076839 -4290775858))
  (test -184549633 (bitwise-ior -193073517 1689392892))
  (test -2604237975 (bitwise-xor 1694076839 -4290775858))
  (test -1865418641 (bitwise-xor -193073517 1689392892))
  (test 3769478 (bitwise-and 1694076839 -4290775858))
  (test 1680869008 (bitwise-and -193073517 1689392892))
  (test 0 (bitwise-andc1 0 0))
  (test -1 (bitwise-andc1 0 -1))
  (test 123 (bitwise-andc1 0 123))
  (test 0 (bitwise-andc2 0 0))
  (test -1 (bitwise-andc2 -1 0))
  (test -1 (bitwise-nand 0 0))
  (test -1 (bitwise-nand 0 -1))
  (test -124 (bitwise-nand -1 123))
  (test -1 (bitwise-nor 0 0))
  (test 0 (bitwise-nor 0 -1))
  (test 0 (bitwise-nor -1 123))
  (test -1 (bitwise-orc1 0 0))
  (test -1 (bitwise-orc1 0 -1))
  (test 0 (bitwise-orc1 -1 0))
  (test -124 (bitwise-orc1 123 0))
  (test -1 (bitwise-orc2 0 0))
  (test -1 (bitwise-orc2 -1 0))
  (test 0 (bitwise-orc2 0 -1))
  (test -124 (bitwise-orc2 0 123))
  (test -11 (bitwise-nand 11 26))
  (test -28 (bitwise-nor  11 26))
  (test 16 (bitwise-andc1 11 26))
  (test 1 (bitwise-andc2 11 26))
  (test -2 (bitwise-orc1 11 26))
  (test 1 (arithmetic-shift 1 0))
  (test 2 (arithmetic-shift 1 1))
  (test 4 (arithmetic-shift 1 2))
  (test 8 (arithmetic-shift 1 3))
  (test 16 (arithmetic-shift 1 4))
  (test (expt 2 31) (arithmetic-shift 1 31))
  (test (expt 2 32) (arithmetic-shift 1 32))
  (test (expt 2 33) (arithmetic-shift 1 33))
  (test (expt 2 63) (arithmetic-shift 1 63))
  (test (expt 2 64) (arithmetic-shift 1 64))
  (test (expt 2 65) (arithmetic-shift 1 65))
  (test (expt 2 127) (arithmetic-shift 1 127))
  (test (expt 2 128) (arithmetic-shift 1 128))
  (test (expt 2 129) (arithmetic-shift 1 129))
  (test 3028397001194014464 (arithmetic-shift 11829675785914119 8))

  (test -1 (arithmetic-shift -1 0))
  (test -2 (arithmetic-shift -1 1))
  (test -4 (arithmetic-shift -1 2))
  (test -8 (arithmetic-shift -1 3))
  (test -16 (arithmetic-shift -1 4))
  (test (- (expt 2 31)) (arithmetic-shift -1 31))
  (test (- (expt 2 32)) (arithmetic-shift -1 32))
  (test (- (expt 2 33)) (arithmetic-shift -1 33))
  (test (- (expt 2 63)) (arithmetic-shift -1 63))
  (test (- (expt 2 64)) (arithmetic-shift -1 64))
  (test (- (expt 2 65)) (arithmetic-shift -1 65))
  (test (- (expt 2 127)) (arithmetic-shift -1 127))
  (test (- (expt 2 128)) (arithmetic-shift -1 128))
  (test (- (expt 2 129)) (arithmetic-shift -1 129))

  (test 0 (arithmetic-shift 1 -63))
  (test 0 (arithmetic-shift 1 -64))
  (test 0 (arithmetic-shift 1 -65))

  (test #x1000000000000000100000000000000000000000000000000
      (arithmetic-shift #x100000000000000010000000000000000 64))
  (test #x8e73b0f7da0e6452c810f32b809079e5
      (arithmetic-shift #x8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b -64))

  (test-assert (not (bit-set? 64 1)))
  (test-assert (bit-set? 64 #x10000000000000000))

  (test #b1010 (bit-field #b1101101010 0 4))
  (test #b101101 (bit-field #b1101101010 3 9))
  (test #b10110 (bit-field #b1101101010 4 9))
  (test #b110110 (bit-field #b1101101010 4 10))
  (test #t (bit-field-any? #b101101 0 2))
  (test #t (bit-field-any? #b101101 2 4))
  (test #f (bit-field-any? #b101101 1 2))
  (test #f (bit-field-every? #b101101 0 2))
  (test #t (bit-field-every? #b101101 2 4))
  (test #t (bit-field-every? #b101101 0 1))

  (test 3 (bitwise-if 1 1 2))
  (test #b100000 (bit-field-clear #b101010 1 4))
  (test #b101110 (bit-field-set #b101010 1 4))
  (test #b100100 (bit-field-replace #b101010 #b010 1 4))
  (test #b1001 (bit-field-replace-same #b1111 #b0000 1 3))
  (test #b00110011 (bitwise-if #b00111100 #b11110000 #b00001111))

  (test #b1 (copy-bit 0 0 #t))
  (test #b100 (copy-bit 2 0 #t))
  (test #b1011 (copy-bit 2 #b1111 #f))

  (test #b1110 (bit-swap 0 1 #b1101))
  (test #b1011 (bit-swap 1 2 #b1101))
  (test #b1011 (bit-swap 2 1 #b1101))
  (test #b10000000101 (bit-swap 3 10 #b1101))

  (test '(#t #f #t #f #t #t #t) (integer->list #b1010111))
  (test '(#t #f #t #t #t) (integer->list #b1010111 5))
  (test '(#f #f #t #f #t #f #t #t #t) (integer->list #b1010111 9))
  (test '#(#t #f #t #f #t #t #t) (integer->vector #b1010111))
  (test '#(#f #f #t #f #t #f #t #t #t) (integer->vector #b1010111 9))

  (test #b1110101 (list->integer '(#t #t #t #f #t #f #t)))
  (test #b111010100 (list->integer '(#t #t #t #f #t #f #t #f #f)))
  (test #b1110101 (vector->integer '#(#t #t #t #f #t #f #t)))
  (test #b111010100 (vector->integer '#(#f #f #f #t #t #t #f #t #f #t #f #f)))
  (test #b1110101 (bits #t #t #t #f #t #f #t))
  (test #b111010100 (bits #t #t #t #f #t #f #t #f #f))

  (test '(#t #f #t #f #t #t #t) (bitwise-fold cons '() #b1010111))

  (test 5
      (let ((count 0))
        (bitwise-for-each (lambda (b) (if b (set! count (+ count 1))))
                          #b1010111)
        count))

  (test #b101010101
      (bitwise-unfold (lambda (i) (= i 10)) even? (lambda (i) (+ i 1)) 0))

  (test 6 (bitwise-and 14 6))
  (test 6 (bitwise-and 14 6))
  (test 14 (bitwise-ior 10 12))
  (test 14 (bitwise-ior 10 12))
  (test 6 (bitwise-xor 10 12))
  (test 6 (bitwise-xor 10 12))
  (test -1 (bitwise-not 0))
  (test 0 (bitwise-not -1))
  (test -1 (bitwise-not 0))
  (test 0 (bitwise-not -1))
  (test 9 (bitwise-if 3 1 8))
  (test 0 (bitwise-if 3 8 1))
  (test 9 (bitwise-if 3 1 8))
  (test 0 (bitwise-if 3 8 1))
  (test #t (any-bit-set? 3 6))
  (test #f (any-bit-set? 3 12))
  (test #t (any-bit-set? 3 6))
  (test #f (any-bit-set? 3 12))
  (test #t (every-bit-set? 4 6))
  (test #f (every-bit-set? 7 6))
  (test 2 (bit-count 12))
  (test 2 (bit-count 12))
  (test 0 (integer-length 0))
  (test 8 (integer-length 128))
  (test 8 (integer-length 255))
  (test 9 (integer-length 256))
  (test -1 (first-set-bit 0))
  (test 0 (first-set-bit 1))
  (test 0 (first-set-bit 3))
  (test 2 (first-set-bit 4))
  (test 1 (first-set-bit 6))
  (test 0 (first-set-bit -1))
  (test 1 (first-set-bit -2))
  (test 0 (first-set-bit -3))
  (test 2 (first-set-bit -4))
  (test 128 (first-set-bit #x100000000000000000000000000000000))
  (test -1 (first-set-bit 0))
  (test 0 (first-set-bit 1))
  (test 0 (first-set-bit 3))
  (test 2 (first-set-bit 4))
  (test 1 (first-set-bit 6))
  (test 0 (first-set-bit -1))
  (test 1 (first-set-bit -2))
  (test 0 (first-set-bit -3))
  (test 2 (first-set-bit -4))
  (test #t (bit-set? 0 1))
  (test #f (bit-set? 1 1))
  (test #f (bit-set? 1 8))
  (test #t (bit-set? 1000 -1))
  (test #t (bit-set? 0 1))
  (test #f (bit-set? 1 1))
  (test #f (bit-set? 1 8))
  (test #t (bit-set? 1000 -1))
  (test 0 (copy-bit 0 0 #f))
  (test 0 (copy-bit 30 0 #f))
  (test 0 (copy-bit 31 0 #f))
  (test 0 (copy-bit 62 0 #f))
  (test 0 (copy-bit 63 0 #f))
  (test 0 (copy-bit 128 0 #f))
  (test -1 (copy-bit 0 -1 #t))
  (test -1 (copy-bit 30 -1 #t))
  (test -1 (copy-bit 31 -1 #t))
  (test -1 (copy-bit 62 -1 #t))
  (test -1 (copy-bit 63 -1 #t))
  (test -1 (copy-bit 128 -1 #t))
  (test 1 (copy-bit 0 0 #t))
  (test #x106 (copy-bit 8 6 #t))
  (test 6 (copy-bit 8 6 #f))
  (test -2 (copy-bit 0 -1 #f))
    (test 0 (copy-bit 128 #x100000000000000000000000000000000 #f))
  (test #x100000000000000000000000000000000
		 (copy-bit 128 #x100000000000000000000000000000000 #t))
  (test #x100000000000000000000000000000000
		 (copy-bit 64 #x100000000000000000000000000000000 #f))
  (test #x-100000000000000000000000000000000
		 (copy-bit 64 #x-100000000000000000000000000000000 #f))
  (test #x-100000000000000000000000000000000
		 (copy-bit 256 #x-100000000000000000000000000000000 #t))
  (test 0 (bit-field 6 0 1))
  (test 3 (bit-field 6 1 3))
  (test 1 (bit-field 6 2 999))
  (test 1 (bit-field #x100000000000000000000000000000000 128 129))
  (test #b111 (bit-field-replace #b110 1 0 1))
  (test #b110 (bit-field-replace #b110 1 1 2))
  (test #b010 (bit-field-replace #b110 1 1 3))
  (test 2 (arithmetic-shift 1 1))
  (test 0 (arithmetic-shift 1 -1))
  (test 2 (arithmetic-shift 1 1))
  (test 0 (arithmetic-shift 1 -1))
  (test #b110  (bit-field-rotate #b110 1 1 2))
  (test #b1010 (bit-field-rotate #b110 1 2 4))
  (test #b1011 (bit-field-rotate #b0111 -1 1 4))
  (test #b0  (bit-field-rotate #b0 128 0 256))
  (test #b1  (bit-field-rotate #b1 128 1 256))
      (test #x100000000000000000000000000000000
	    (bit-field-rotate #x100000000000000000000000000000000 128 0 64))
      (test #x100000000000000000000000000000008
	    (bit-field-rotate #x100000000000000000000000000000001 3 0 64))
      (test #x100000000000000002000000000000000
	    (bit-field-rotate #x100000000000000000000000000000001 -3 0 64))
  (test #b110 (bit-field-rotate #b110 0 0 10))
  (test #b110 (bit-field-rotate #b110 0 0 256))
  (test 1 (bit-field-rotate #x100000000000000000000000000000000 1 0 129))
  (test 6 (bit-field-reverse 6 1 3))
  (test 12 (bit-field-reverse 6 1 4))
  (test #x80000000 (bit-field-reverse 1 0 32))
  (test #x40000000 (bit-field-reverse 1 0 31))
  (test #x20000000 (bit-field-reverse 1 0 30))
  (test (bitwise-ior (arithmetic-shift -1 32) #xFBFFFFFF)
		 (bit-field-reverse -2 0 27))
  (test (bitwise-ior (arithmetic-shift -1 32) #xF7FFFFFF)
		 (bit-field-reverse -2 0 28))
  (test (bitwise-ior (arithmetic-shift -1 32) #xEFFFFFFF)
		 (bit-field-reverse -2 0 29))
  (test (bitwise-ior (arithmetic-shift -1 32) #xDFFFFFFF)
		 (bit-field-reverse -2 0 30))
  (test (bitwise-ior (arithmetic-shift -1 32) #xBFFFFFFF)
		 (bit-field-reverse -2 0 31))
  (test (bitwise-ior (arithmetic-shift -1 32) #x7FFFFFFF)
		 (bit-field-reverse -2 0 32))
    (test 5 (bit-field-reverse #x140000000000000000000000000000000 0 129))
  (test '(#t #t) (integer->list 3))
  (test '(#f #t #t #f) (integer->list 6 4))
  (test '(#t #f) (integer->list 6 2))
    (test '(#f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #t)
	    (integer->list 1 128))
    (test '(#t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t)
	    (integer->list -1 128))
  (test '(#t
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f)
		   (integer->list #x100000000000000000000000000000000))
  (test 6 (list->integer '(#t #t #f)))
  (test 12 (list->integer '(#t #t #f #f)))
  (test 6 (list->integer '(#f #t #t #f)))
  (test 2 (list->integer '(#t #f)))
    (test 1 (list->integer
	     '(#f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #t)))
  (test #x100000000000000000000000000000000
		 (list->integer
		  '(#t
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f)))
  (test #x03FFFFFF (list->integer '(#t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x07FFFFFF (list->integer '(#t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x0FFFFFFF (list->integer '(#t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x1FFFFFFF (list->integer '(#t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x3FFFFFFF (list->integer '(#t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x7FFFFFFF (list->integer '(#t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #xFFFFFFFF (list->integer '(#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x1FFFFFFFF (list->integer '(#t
					      #t #t #t #t #t #t #t #t
					      #t #t #t #t #t #t #t #t
					      #t #t #t #t #t #t #t #t
					      #t #t #t #t #t #t #t #t)))
  (test 0 (bits))
  (let ((g (make-bitwise-generator #b110)))
    (test #f (g))
    (test #t (g))
    (test #t (g))
    (test #f (g)))
  (test -11 (bitwise-not 10))
  (test 36 (bitwise-not -37))
  (test 11 (bitwise-ior 3  10))
  (test 10 (bitwise-and 11 26))
  (test 9 (bitwise-xor 3 10))
  (test -42 (bitwise-eqv 37 12))
  (test 4 (bitwise-and 37 12))
  (test 32 (arithmetic-shift 8 2))
  (test 4 (arithmetic-shift 4 0))
  (test 4 (arithmetic-shift 8 -1))
  (test -79 (arithmetic-shift -100000000000000000000000000000000 -100))
  (test 32 (arithmetic-shift 8 2))
  (test 4 (arithmetic-shift 4 0))
  (test 4 (arithmetic-shift 8 -1))
  (test -79 (arithmetic-shift -100000000000000000000000000000000 -100))
  (test 0 (integer-length  0))
  (test 1 (integer-length  1))
  (test 0 (integer-length -1))
  (test 3 (integer-length  7))
  (test 3 (integer-length -7))
  (test 4 (integer-length  8))
  (test 3 (integer-length -8))
  (test #f (bit-set? 1 1))
  (test #t (bit-set? 0 1))
  (test #t (bit-set? 3 10))
  (test #t (bit-set? 2 6))
  (test #f (bit-set? 0 6))
  (test 1 (copy-bit 0 0 #t))
  (test #b100 (copy-bit 2 0 #t))
  (test #b1011 (copy-bit 2 #b1111 #f))
  (test 1 (bit-swap 0 2 4))
  (test 0 (first-set-bit 1))
  (test 1 (first-set-bit 2))
  (test -1 (first-set-bit 0))
  (test 3 (first-set-bit 40))
  (test 2 (first-set-bit -28))
  (test 99 (first-set-bit (expt  2 99)))
  (test 99 (first-set-bit (expt -2 99)))
  (test -1 (bitwise-not 0))
  (test 0 (bitwise-and #b0 #b1))
  (test 1 (bitwise-and #b1 #b1))
  (test 0 (bitwise-and #b1 #b10))
  (test #b10 (bitwise-and #b11 #b10))
  (test #b101 (bitwise-and #b101 #b111))
  (test #b111 (bitwise-and -1 #b111))
  (test #b110 (bitwise-and -2 #b111))
  (test 3769478 (bitwise-and -4290775858 1694076839))
  (test 1680869008 (bitwise-and -193073517 1689392892))
  (test -4294967295 (bitwise-ior 1 (- -1 #xffffffff)))
  (test -18446744073709551615 (bitwise-ior 1 (- -1 #xffffffffffffffff)))
  (test -4294967126 (bitwise-xor #b10101010 (- -1 #xffffffff)))
  (test (bitwise-not -4294967126) (bitwise-eqv #b10101010 (- -1 #xffffffff)))
  (test -18446744073709551446 (bitwise-xor #b10101010 (- -1 #xffffffffffffffff)))
  (test -2600468497 (bitwise-ior 1694076839 -4290775858))
  (test -184549633 (bitwise-ior -193073517 1689392892))
  (test -2604237975 (bitwise-xor 1694076839 -4290775858))
  (test -1865418641 (bitwise-xor -193073517 1689392892))
  (test 3769478 (bitwise-and 1694076839 -4290775858))
  (test 1680869008 (bitwise-and -193073517 1689392892))
  (test 0 (bitwise-andc1 0 0))
  (test -1 (bitwise-andc1 0 -1))
  (test 123 (bitwise-andc1 0 123))
  (test 0 (bitwise-andc2 0 0))
  (test -1 (bitwise-andc2 -1 0))
  (test -1 (bitwise-nand 0 0))
  (test -1 (bitwise-nand 0 -1))
  (test -124 (bitwise-nand -1 123))
  (test -1 (bitwise-nor 0 0))
  (test 0 (bitwise-nor 0 -1))
  (test 0 (bitwise-nor -1 123))
  (test -1 (bitwise-orc1 0 0))
  (test -1 (bitwise-orc1 0 -1))
  (test 0 (bitwise-orc1 -1 0))
  (test -124 (bitwise-orc1 123 0))
  (test -1 (bitwise-orc2 0 0))
  (test -1 (bitwise-orc2 -1 0))
  (test 0 (bitwise-orc2 0 -1))
  (test -124 (bitwise-orc2 0 123))
  (test -11 (bitwise-nand 11 26))
  (test -28 (bitwise-nor  11 26))
  (test 16 (bitwise-andc1 11 26))
  (test 1 (bitwise-andc2 11 26))
  (test -2 (bitwise-orc1 11 26))
  (test 1 (arithmetic-shift 1 0))
  (test 2 (arithmetic-shift 1 1))
  (test 4 (arithmetic-shift 1 2))
  (test 8 (arithmetic-shift 1 3))
  (test 16 (arithmetic-shift 1 4))
  (test (expt 2 31) (arithmetic-shift 1 31))
  (test (expt 2 32) (arithmetic-shift 1 32))
  (test (expt 2 33) (arithmetic-shift 1 33))
  (test (expt 2 63) (arithmetic-shift 1 63))
  (test (expt 2 64) (arithmetic-shift 1 64))
  (test (expt 2 65) (arithmetic-shift 1 65))
  (test (expt 2 127) (arithmetic-shift 1 127))
  (test (expt 2 128) (arithmetic-shift 1 128))
  (test (expt 2 129) (arithmetic-shift 1 129))
  (test 3028397001194014464 (arithmetic-shift 11829675785914119 8))
  (test -1 (arithmetic-shift -1 0))
  (test -2 (arithmetic-shift -1 1))
  (test -4 (arithmetic-shift -1 2))
  (test -8 (arithmetic-shift -1 3))
  (test -16 (arithmetic-shift -1 4))
  (test (- (expt 2 31)) (arithmetic-shift -1 31))
  (test (- (expt 2 32)) (arithmetic-shift -1 32))
  (test (- (expt 2 33)) (arithmetic-shift -1 33))
  (test (- (expt 2 63)) (arithmetic-shift -1 63))
  (test (- (expt 2 64)) (arithmetic-shift -1 64))
  (test (- (expt 2 65)) (arithmetic-shift -1 65))
  (test (- (expt 2 127)) (arithmetic-shift -1 127))
  (test (- (expt 2 128)) (arithmetic-shift -1 128))
  (test (- (expt 2 129)) (arithmetic-shift -1 129))
  (test 0 (arithmetic-shift 1 -63))
  (test 0 (arithmetic-shift 1 -64))
  (test 0 (arithmetic-shift 1 -65))
  (test-assert (not (bit-set? 64 1)))
  (test-assert (bit-set? 64 #x10000000000000000))
  (test #b1010 (bit-field #b1101101010 0 4))
  (test #b101101 (bit-field #b1101101010 3 9))
  (test #b10110 (bit-field #b1101101010 4 9))
  (test #b110110 (bit-field #b1101101010 4 10))
  (test #t (bit-field-any? #b101101 0 2))
  (test #t (bit-field-any? #b101101 2 4))
  (test #f (bit-field-any? #b101101 1 2))
  (test #f (bit-field-every? #b101101 0 2))
  (test #t (bit-field-every? #b101101 2 4))
  (test #t (bit-field-every? #b101101 0 1))
  (test 3 (bitwise-if 1 1 2))
  (test #b100000 (bit-field-clear #b101010 1 4))
  (test #b101110 (bit-field-set #b101010 1 4))
  (test #b100100 (bit-field-replace #b101010 #b010 1 4))
  (test #b1001 (bit-field-replace-same #b1111 #b0000 1 3))
  (test #b00110011 (bitwise-if #b00111100 #b11110000 #b00001111))
  (test #b1 (copy-bit 0 0 #t))
  (test #b100 (copy-bit 2 0 #t))
  (test #b1011 (copy-bit 2 #b1111 #f))
  (test #b1110 (bit-swap 0 1 #b1101))
  (test #b1011 (bit-swap 1 2 #b1101))
  (test #b1011 (bit-swap 2 1 #b1101))
  (test #b10000000101 (bit-swap 3 10 #b1101))
  (test '(#t #f #t #f #t #t #t) (integer->list #b1010111))
  (test '(#t #f #t #t #t) (integer->list #b1010111 5))
  (test '(#f #f #t #f #t #f #t #t #t) (integer->list #b1010111 9))
  (test '#(#t #f #t #f #t #t #t) (integer->vector #b1010111))
  (test '#(#f #f #t #f #t #f #t #t #t) (integer->vector #b1010111 9))
  (test #b1110101 (list->integer '(#t #t #t #f #t #f #t)))
  (test #b111010100 (list->integer '(#t #t #t #f #t #f #t #f #f)))
  (test #b1110101 (vector->integer '#(#t #t #t #f #t #f #t)))
  (test #b111010100 (vector->integer '#(#f #f #f #t #t #t #f #t #f #t #f #f)))
  (test #b1110101 (bits #t #t #t #f #t #f #t))
  (test #b111010100 (bits #t #t #t #f #t #f #t #f #f))
  (test '(#t #f #t #f #t #t #t) (bitwise-fold cons '() #b1010111))
  (test 6 (bitwise-and 14 6))
  (test 6 (bitwise-and 14 6))
  (test 14 (bitwise-ior 10 12))
  (test 14 (bitwise-ior 10 12))
  (test 6 (bitwise-xor 10 12))
  (test 6 (bitwise-xor 10 12))
  (test -1 (bitwise-not 0))
  (test 0 (bitwise-not -1))
  (test -1 (bitwise-not 0))
  (test 0 (bitwise-not -1))
  (test 9 (bitwise-if 3 1 8))
  (test 0 (bitwise-if 3 8 1))
  (test 9 (bitwise-if 3 1 8))
  (test 0 (bitwise-if 3 8 1))
  (test #t (any-bit-set? 3 6))
  (test #f (any-bit-set? 3 12))
  (test #t (any-bit-set? 3 6))
  (test #f (any-bit-set? 3 12))
  (test #t (every-bit-set? 4 6))
  (test #f (every-bit-set? 7 6))
  (test 2 (bit-count 12))
  (test 2 (bit-count 12))
  (test 0 (integer-length 0))
  (test 8 (integer-length 128))
  (test 8 (integer-length 255))
  (test 9 (integer-length 256))
  (test -1 (first-set-bit 0))
  (test 0 (first-set-bit 1))
  (test 0 (first-set-bit 3))
  (test 2 (first-set-bit 4))
  (test 1 (first-set-bit 6))
  (test 0 (first-set-bit -1))
  (test 1 (first-set-bit -2))
  (test 0 (first-set-bit -3))
  (test 2 (first-set-bit -4))
  (test 128 (first-set-bit #x100000000000000000000000000000000))
  (test -1 (first-set-bit 0))
  (test 0 (first-set-bit 1))
  (test 0 (first-set-bit 3))
  (test 2 (first-set-bit 4))
  (test 1 (first-set-bit 6))
  (test 0 (first-set-bit -1))
  (test 1 (first-set-bit -2))
  (test 0 (first-set-bit -3))
  (test 2 (first-set-bit -4))
  (test #t (bit-set? 0 1))
  (test #f (bit-set? 1 1))
  (test #f (bit-set? 1 8))
  (test #t (bit-set? 1000 -1))
  (test #t (bit-set? 0 1))
  (test #f (bit-set? 1 1))
  (test #f (bit-set? 1 8))
  (test #t (bit-set? 1000 -1))
  (test 0 (copy-bit 0 0 #f))
  (test 0 (copy-bit 30 0 #f))
  (test 0 (copy-bit 31 0 #f))
  (test 0 (copy-bit 62 0 #f))
  (test 0 (copy-bit 63 0 #f))
  (test 0 (copy-bit 128 0 #f))
  (test -1 (copy-bit 0 -1 #t))
  (test -1 (copy-bit 30 -1 #t))
  (test -1 (copy-bit 31 -1 #t))
  (test -1 (copy-bit 62 -1 #t))
  (test -1 (copy-bit 63 -1 #t))
  (test -1 (copy-bit 128 -1 #t))
  (test 1 (copy-bit 0 0 #t))
  (test #x106 (copy-bit 8 6 #t))
  (test 6 (copy-bit 8 6 #f))
  (test -2 (copy-bit 0 -1 #f))
    (test 0 (copy-bit 128 #x100000000000000000000000000000000 #f))
  (test 0 (bit-field 6 0 1))
  (test 3 (bit-field 6 1 3))
  (test 1 (bit-field 6 2 999))
  (test 1 (bit-field #x100000000000000000000000000000000 128 129))
  (test #b111 (bit-field-replace #b110 1 0 1))
  (test #b110 (bit-field-replace #b110 1 1 2))
  (test #b010 (bit-field-replace #b110 1 1 3))
  (test 2 (arithmetic-shift 1 1))
  (test 0 (arithmetic-shift 1 -1))
  (test 2 (arithmetic-shift 1 1))
  (test 0 (arithmetic-shift 1 -1))
  (test #b110  (bit-field-rotate #b110 1 1 2))
  (test #b1010 (bit-field-rotate #b110 1 2 4))
  (test #b1011 (bit-field-rotate #b0111 -1 1 4))
  (test #b0  (bit-field-rotate #b0 128 0 256))
  (test #b1  (bit-field-rotate #b1 128 1 256))
  (test #b110 (bit-field-rotate #b110 0 0 10))
  (test #b110 (bit-field-rotate #b110 0 0 256))
    (test 1 (bit-field-rotate #x100000000000000000000000000000000 1 0 129))
  (test 6 (bit-field-reverse 6 1 3))
  (test 12 (bit-field-reverse 6 1 4))
  (test #x80000000 (bit-field-reverse 1 0 32))
  (test #x40000000 (bit-field-reverse 1 0 31))
  (test #x20000000 (bit-field-reverse 1 0 30))
    (test 5 (bit-field-reverse #x140000000000000000000000000000000 0 129))
  (test '(#t #t) (integer->list 3))
  (test '(#f #t #t #f) (integer->list 6 4))
  (test '(#t #f) (integer->list 6 2))
    (test '(#f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		 #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #t)
	    (integer->list 1 128))
    (test '(#t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t
		 #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t #t)
	    (integer->list -1 128))

(test '(#t
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		     #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f)
		   (integer->list #x100000000000000000000000000000000))
  (test 6 (list->integer '(#t #t #f)))
  (test 12 (list->integer '(#t #t #f #f)))
  (test 6 (list->integer '(#f #t #t #f)))
  (test 2 (list->integer '(#t #f)))
    (test 1 (list->integer
	     '(#f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		  #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #t)))

  (test #x100000000000000000000000000000000
		 (list->integer
		  '(#t
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f
		    #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f)))

  (test #x03FFFFFF (list->integer '(#t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x07FFFFFF (list->integer '(#t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x0FFFFFFF (list->integer '(#t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x1FFFFFFF (list->integer '(#t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x3FFFFFFF (list->integer '(#t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x7FFFFFFF (list->integer '(#t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #xFFFFFFFF (list->integer '(#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t
						#t #t #t #t #t #t #t #t)))
  (test #x1FFFFFFFF (list->integer '(#t
					      #t #t #t #t #t #t #t #t
					      #t #t #t #t #t #t #t #t
					      #t #t #t #t #t #t #t #t
					      #t #t #t #t #t #t #t #t)))
  (test 0 (bits))
  (test -11 (bitwise-not 10))
  (test 36 (bitwise-not -37))
  (test 11 (bitwise-ior 3  10))
  (test 10 (bitwise-and 11 26))
  (test 9 (bitwise-xor 3 10))
  (test -42 (bitwise-eqv 37 12))
  (test 4 (bitwise-and 37 12))
  (test 32 (arithmetic-shift 8 2))
  (test 4 (arithmetic-shift 4 0))
  (test 4 (arithmetic-shift 8 -1))
  (test -79 (arithmetic-shift -100000000000000000000000000000000 -100))
  (test 32 (arithmetic-shift 8 2))
  (test 4 (arithmetic-shift 4 0))
  (test 4 (arithmetic-shift 8 -1))
  (test -79 (arithmetic-shift -100000000000000000000000000000000 -100))
  (test 0 (integer-length  0))
  (test 1 (integer-length  1))
  (test 0 (integer-length -1))
  (test 3 (integer-length  7))
  (test 3 (integer-length -7))
  (test 4 (integer-length  8))
  (test 3 (integer-length -8))
  (test #f (bit-set? 1 1))
  (test #t (bit-set? 0 1))
  (test #t (bit-set? 3 10))
  (test #t (bit-set? 1000000 -1))
  (test #t (bit-set? 2 6))
  (test #f (bit-set? 0 6))
  (test 1 (copy-bit 0 0 #t))
  (test #b100 (copy-bit 2 0 #t))
  (test #b1011 (copy-bit 2 #b1111 #f))
  (test 1 (bit-swap 0 2 4))
  (test 0 (first-set-bit 1))
  (test 1 (first-set-bit 2))
  (test -1 (first-set-bit 0))
  (test 3 (first-set-bit 40))
  (test 2 (first-set-bit -28))
  (test 99 (first-set-bit (expt  2 99)))
  (test 99 (first-set-bit (expt -2 99)))
)
(test-exit)
