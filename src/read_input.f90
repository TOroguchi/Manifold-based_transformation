!
! Reading information from input file
!
subroutine read_input()

  use all_var
  
  !
  !
  character(len=200) :: input_file,output_file

  integer :: narg
  character(len=200) :: argv
  logical :: ex

  integer :: file_len
!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  input_err=0

  narg=iargc()
  if(narg .eq. 0)then
     print '(a)','No input file'
     input_err=1
     goto 1000
  else
     if(narg .eq. 1)then
        print '(a)','No output file'
        input_err=2
        goto 1000
     else
        call getarg(1,argv)
        read(argv,'(a)')input_file
        call getarg(2,argv)
        read(argv,'(a)')output_file
     end if
  end if

  inquire(file=input_file,exist=ex)
  if(ex)then
     continue
  else
     print '(2a)','Cannot find ',input_file
     input_err=3
     goto 1000
  end if
!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  open(11,file=input_file)
  open(21,file=output_file)

  file_len=len_trim(input_file)
  write(21,'(a8,a)')'Reading ',input_file(1:file_len)

  read(11,'(14x,i)')n_qv
  read(11,'(14x,i)')qv_range1
  read(11,'(14x,i)')qv_range2
  read(11,'(14x,i)')n_bin
  read(11,'(14x,i)')k_gradient

  read(11,'(14x,a)')exp_file

  read(11,'(14x,a)')bin_header
  read(11,'(14x,a)')bin_footer

  read(11,'(14x,a)')pdd0_file
  read(11,'(14x,a)')true_pdd_file

  read(11,'(14x,i)')k_const
  if(k_const .eq. 0)then
     conf_fac=0.0d0
  else
     read(11,'(14x,f)')conf_fac
  end if

  read(11,'(14x,f)')trans_rate
  read(11,'(14x,i)')n_trans
  read(11,'(14x,i)')n_out
  do i=1,n_out
     read(11,'(14x,i)')out_trans(i)
  end do
  read(11,'(14x,i)')out_trans_step
  read(11,'(14x,a)')out_header

  close(11)

  write(21,'(a)')'Reading end'
  write(21,*)

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
1000 continue

  return
end subroutine read_input
