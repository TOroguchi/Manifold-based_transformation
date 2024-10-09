!
!
subroutine output_data()

  use all_var

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!
  write(201,'(i8,1x,3e16.8e2)')count,kai2,arep,kld_fr0

  !
  !
  do i=1,n_out

     if(count .eq. out_trans(i))then

        write(fno8,'(i8.8)')count

        out_file2=out_header(1:out_header_len)//'_out-'//fno8//'_pdd.txt'
        out_file2_len=len_trim(out_file2)
        open(202,file=out_file2(1:out_file2_len))
        do j=1,n_bin
           write(202,'(a14,2x,f14.10)')bin_data(j),d_pdd(j)
        end do
        close(202)

        out_file3=out_header(1:out_header_len)//'_out-'//fno8//'_saxs-iv.txt'
        out_file3_len=len_trim(out_file3)
        open(203,file=out_file3(1:out_file3_len))
        do j=qv_range1,qv_range2
           write(203,'(2e18.10e2)')qv(j),bin_iv_ave(j)
        end do
        close(203)

     else
        continue
     end if

  end do

  !
  !
  if(count .eq. out_count*out_trans_step)then

     out_count=out_count+1
     write(fno8,'(i8.8)')count
     
     out_file2=out_header(1:out_header_len)//'_out-'//fno8//'_pdd.txt'
     out_file2_len=len_trim(out_file2)
     open(202,file=out_file2(1:out_file2_len))
     do i=1,n_bin
        write(202,'(a14,2x,f14.10)')bin_data(i),d_pdd(i)
     end do
     close(202)
     
     out_file3=out_header(1:out_header_len)//'_out-'//fno8//'_saxs-iv.txt'
     out_file3_len=len_trim(out_file3)
     open(203,file=out_file3(1:out_file3_len))
     do i=qv_range1,qv_range2
        write(203,'(2e18.10e2)')qv(i),bin_iv_ave(i)
     end do
     close(203)
     
  else
     continue
  end if

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!

  return
end subroutine output_data
