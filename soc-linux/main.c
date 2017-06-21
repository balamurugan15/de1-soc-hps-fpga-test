#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "fpga_control.h"

#define PAGE_SIZE sysconf(_SC_PAGESIZE)
#define LWHPS2FPGA_BASE 0xff200000

int init_fpga_control(struct fpga_control *fpga)
{
	fpga->fd = open("/dev/mem", O_RDWR);
	if (fpga->fd < 0)
		return -1;

	fpga->mem = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE,
			MAP_SHARED, fpga->fd, LWHPS2FPGA_BASE);
	if (fpga->mem == MAP_FAILED) {
		close(fpga->fd);
		return -1;
	}

	fpga->main_link = fpga->mem + MAIN_LINK_OFFSET;

	return 0;
}


void fpga_copy_output(struct fpga_control *fpga, uint32_t *output)
{
	int i;

	for (i = 0; i < OUTPUT_SIZE; i++)
		output[i] = fpga->main_link[i];
}




int main(void){
	
	struct fpga_control fpga[1];
	uint32_t outs[OUTPUT_SIZE];
	int i;
	
	printf("initializing fpga control\n");
	if (init_fpga_control(fpga)) {
		printf("Could not initialize fpga controller\n");
		getchar();
		exit(1);
	}
	
	printf("Reading from fpga.... \n");
	fpga_copy_output(fpga, outs);
	
	printf("Output: \n");
	for(i=0; i<OUTPUT_SIZE; i++){
		printf("%x", outs[i]);
	}
	
}
