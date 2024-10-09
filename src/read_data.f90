!
!
subroutine read_data()

  use all_var

  !
  !
  logical :: ex
  integer :: file_len
!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  inquire(file=exp_file,exist=ex)
  if(ex)then
     continue
  else
     file_len=len_trim(exp_file)
     write(21,'(2a)')'Cannot find ',exp_file(1:file_len)
     input_err=1
     goto 1000
  end if

  open(101,file=exp_file)
  do i=1,n_qv
     read(101,'(3e18.10e2)')qv(i),exp_iv(i),exp_iv_sigma(i)
  end do
  close(101)

  !
  !
  bin_header_len=len_trim(bin_header)
  bin_footer_len=len_trim(bin_footer)

  do i=1,n_bin

     write(fno5,'(i5.5)')i
     bin_data_file=bin_header(1:bin_header_len)//fno5&
          &//bin_footer(1:bin_footer_len)
     bin_data_file_len=len_trim(bin_data_file)

     inquire(file=bin_data_file,exist=ex)
     if(ex)then
        continue
     else
        write(21,'(2a)')'Cannot find ',bin_data_file(1:bin_data_file_len)
        input_err=2
        goto 1000
     end if

     open(101,file=bin_data_file(1:bin_data_file_len))
     do j=1,n_qv
        read(101,'(18x,e18.10e2)')bin_iv(i,j)
     end do
     close(101)

  end do

  !
  !
  inquire(file=pdd0_file,exist=ex)
  if(ex)then
     continue
  else
     file_len=len_trim(pdd0_file)
     write(21,'(2a)')'Cannot find ',pdd0_file(1:file_len)
     input_err=3
     goto 1000
  end if

  open(101,file=pdd0_file)
  pdd_sum=0.0d0
  do i=1,n_bin
     read(101,'(a14,f14.10)')bin_data(i),pdd0(i)
     pdd_sum=pdd_sum+pdd0(i)
  end do
  pdd0(1:n_bin)=pdd0(1:n_bin)/pdd_sum
  close(101)

  !
  !
  inquire(file=true_pdd_file,exist=ex)
  if(ex)then
     continue
  else
     file_len=len_trim(true_pdd_file)
     write(21,'(2a)')'Cannot find ',true_pdd_file(1:file_len)
     input_err=4
     goto 1000
  end if

  open(101,file=true_pdd_file)
  pdd_sum=0.0d0
  do i=1,n_bin
     read(101,'(14x,f14.10)')true_pdd(i)
     pdd_sum=pdd_sum+true_pdd(i)
  end do
  true_pdd(1:n_bin)=true_pdd(1:n_bin)/pdd_sum
  close(101)

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
1000 continue

  return
end subroutine read_data
