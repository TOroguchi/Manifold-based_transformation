FC              =       ifort

OBJS            =       all_var.o \
			main.o \
			allocate_var.o \
			deallocate_var.o \
			read_input.o \
			read_data.o \
			cal_score.o \
			cal_trans.o \
			output_data.o \

#FGFLAGS		=	-O3 -fast 
FCFLAGS  	=       -O
#LFFLAGS		= 	-mkl
#
#

cal_rmsd:	$(OBJS)
		$(FC) $(FCFLAGS) $(OBJS) -o opt_pdd_saxs.0.1

clean:
		rm *.o *.mod
        
all_var.o:	all_var.f90
		$(FC) $(FCFLAGS) -o all_var.o -c all_var.f90
	
main.o:		main.f90
		$(FC) $(FCFLAGS) -o main.o -c main.f90
	
allocate_var.o:	allocate_var.f90
		$(FC) $(FCFLAGS) -o allocate_var.o -c allocate_var.f90
	
deallocate_var.o:	deallocate_var.f90
		$(FC) $(FCFLAGS) -o deallocate_var.o -c deallocate_var.f90
	
read_input.o:	read_input.f90
		$(FC) $(FCFLAGS) -o read_input.o -c read_input.f90
	
read_data.o:	read_data.f90
		$(FC) $(FCFLAGS) -o read_data.o -c read_data.f90
	
cal_score.o:	cal_score.f90
		$(FC) $(FCFLAGS) -o cal_score.o -c cal_score.f90
	
cal_trans.o:	cal_trans.f90
		$(FC) $(FCFLAGS) -o cal_trans.o -c cal_trans.f90
	
output_data.o:	output_data.f90
		$(FC) $(FCFLAGS) -o output_data.o -c output_data.f90
	

