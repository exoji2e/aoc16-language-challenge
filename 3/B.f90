Program B
    implicit none
    integer     :: i, c, x1, x2, x3, y1, y2, y3, z1, z2, z3
    do i = 1, 1992, 3
        read(*,*) x1, y1, z1, x2, y2, z2, x3, y3, z3
        IF((x1 + x2 > x3) .and. (x1 + x3 > x2) .and. (x2 + x3 > x1)) THEN
            c = c + 1
        ENDIF
        IF((y1 + y2 > y3) .and. (y1 + y3 > y2) .and. (y2 + y3 > y1)) THEN
            c = c + 1
        ENDIF
        IF((z1 + z2 > z3) .and. (z1 + z3 > z2) .and. (z2 + z3 > z1)) THEN
            c = c + 1
        ENDIF
    end do
    print *, c
End Program B
