!
!
program main

  use all_var

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  !k_gradient = 0: Eq. (2)
  !k_gradient = 1: Eq. (18)
  !k_gradient = 2: Eq. (19)

  !k_const = 0: no constraint
  !k_const = 1: with constraint on pdd0

!
!
!!!!!!!!!!!
!
!
  call read_input()

  if(input_err .ne. 0)then
     write(21,'(a)')'Input err'
     close(21)
     goto 1000
  else
     write(21,*)
  end if

  !
  !
  write(21,'(a)')'Allocation of variables'
  call allocate_var()
  write(21,'(a)')'End allocation'
  write(21,*)

  !
  !
  write(21,'(a)')'Reading data'
  call read_data()
  write(21,'(a)')'End reading data'
  write(21,*)

  if(input_err .ne. 0)then
     write(21,'(a,i1)')'input_err = ',input_err
     close(21)
     goto 990
  else
     write(21,*)
  end if

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  out_header_len=len_trim(out_header)

  out_file1=out_header(1:out_header_len)//'_opt.log'
  out_file1_len=len_trim(out_file1)
  open(201,file=out_file1(1:out_file1_len))

  !
  !
  count=0
  out_count=1

  d_pdd(1:n_bin)=pdd0(1:n_bin)
  call cal_score()

  call output_data

  !
  !
  pdd1(1:n_bin)=pdd0(1:n_bin)

  do while (count .lt. n_trans)

     count=count+1
     write(21,'(i8)')count

     call cal_trans()

     d_pdd(1:n_bin)=pdd2(1:n_bin)
     call cal_score()

     call output_data()

     pdd1(1:n_bin)=pdd2(1:n_bin)

  end do

  !
  !
  close(201)

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!

990 continue

  call deallocate_var()

1000 continue

  stop
end program main
