(define (batch-doom64-sheet-nodither pattern palname)
(let* ((filelist (cadr (file-glob pattern 1))))
 (while (not (null? filelist))
  (let* ((filename (car filelist))
         (image (car (gimp-file-load 1 filename filename)))
         (drawable (car (gimp-image-get-active-layer image))))
           (gimp-context-set-background (car (gimp-palette-entry-get-color palname 0)))
           (gimp-layer-flatten (car (gimp-image-get-active-layer image)))
           (gimp-image-convert-indexed image 0 4 0 0 0 palname)
           (set! drawable (car (gimp-image-get-active-layer image)))
           (gimp-file-save 1 image drawable filename filename)
         (set! filelist (cdr filelist))))))
