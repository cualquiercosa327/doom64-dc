(define (doom64-alt-monster pattern palfilename)
(let* ((filelist (cadr (file-glob pattern 1))))
 (while (not (null? filelist))
  (let* ((filename (car filelist))
         (image (car (gimp-file-load 1 filename filename)))
         (palimage (car (gimp-file-load 1 palfilename palfilename)))
         (drawable (car (gimp-image-get-active-layer image)))
         (paldrawable (car (gimp-image-get-active-layer palimage))))
		   (gimp-image-set-colormap image 768 (car (cdr (gimp-image-get-colormap palimage))))
           (set! drawable (car (gimp-image-get-active-layer image)))
           (gimp-file-save 1 image drawable filename filename)
         (set! filelist (cdr filelist))))))
