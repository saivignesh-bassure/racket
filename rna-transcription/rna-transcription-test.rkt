#lang racket/base

(require rackunit)
(require rackunit/text-ui)
(require "rna-transcription.rkt")

(define rna-transcription-tests
  (test-suite
   "RNA transcription tests"
   
   (test-equal? "transcribes cytosine to guanine" (to-rna "C") "G")
   (test-equal? "transcribes guanine to cytosine" (to-rna "G") "C")
   (test-equal? "transcribes adenine to uracil" (to-rna "A") "U")
   (test-equal? "transcribes thymine to adenine" (to-rna "T") "A")
   (test-equal? "transcribes all nucleotides" (to-rna "ACGTGGTCTTAA") "UGCACCAGAAUU")
   (test-exn "it validates dna strands" exn:fail? (lambda () (to-rna "XCGFGGTDTTAA")))))

(run-tests rna-transcription-tests)