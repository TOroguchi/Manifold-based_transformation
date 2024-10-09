!
! Deallocation of variables
!
subroutine deallocate_var()

  use all_var

  !
  !
  deallocate (&
       &bin_data,&
       &d_pdd,&
       &pdd0,&
       &pdd1,&
       &pdd2,&
       &true_pdd,&
       &gradient,&
       &stat=allocate_err)

  deallocate (&
       &qv,&
       &exp_iv,&
       &exp_iv_sigma,&
       &bin_iv,&
       &bin_iv_ave,&
       &bin_iv_ave_old,&
       &diff_iv,&
       &gradient,&
       &stat=allocate_err)

  !
  !
  return
end subroutine deallocate_var
