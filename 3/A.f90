Program A
    implicit none
    integer     :: i, c, x, y, z
    do i = 1, 1992, 1
        read(*,*) x, y, z
        IF((x + y > z) .and. (x + z > y) .and. (y + z > x)) THEN
            c = c + 1
        ENDIF
    end do
    print *, c
End Program A
