#import <UIKit/UIKit.h>
#include <mach-o/dyld.h>
#include <mach/mach.h>
#include "ViewController.h"
//#import "Code/Code.h"
intptr_t base=0;
static void get_name() {
    int32_t nModNums = _dyld_image_count();
    for (uint32_t i = 0; i < nModNums; i++) {
        const char *pszModName = _dyld_get_image_name(i);
        if (strstr(pszModName, "anogs")) {
            base = (intptr_t)_dyld_get_image_vmaddr_slide(i);
            break;
        }
        
    }
}
template<typename T> void Patch(vm_address_t addr, T data, int size = 0) {
    if(size == 0) size = sizeof(T);
    
    vm_protect(mach_task_self(), (vm_address_t) addr, size, NO, VM_PROT_READ | VM_PROT_WRITE | VM_PROT_COPY);
    memcpy((void*)addr, &data, size);
    vm_protect(mach_task_self(), (vm_address_t)addr, size, NO, VM_PROT_READ | VM_PROT_EXECUTE);
}
static uint64_t OffsetJM(const char addr[]) {
    uint64_t var = strtoul(addr, NULL, 16);
    return var;
}
static __attribute__((constructor)) void _logosLocalCtor_acb97b70(int __unused argc, char __unused **argv, char __unused **envp) {
@autoreleasepool
{
    get_name();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{


        /*Patch<int>(base + OffsetJM("0x0002FAD30"), CFSwapInt32(0x0D000014));        Patch<int>(base + OffsetJM("0x000166C50"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x0005FE08"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x00010C238"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x000C6E00"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x0002AE80"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x000B4D54"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x000AB94C"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x0004F808"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x000521C8"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x00052C88"), CFSwapInt32(0x0D000014));
		  Patch<int>(base + OffsetJM("0x0000d784"), CFSwapInt32(0xc0035fd6));
		  Patch<int>(base + OffsetJM("0x0000d9ac"), CFSwapInt32(0xc0035fd6));		  Patch<int>(base + OffsetJM("0x0000df74"), CFSwapInt32(0xc0035fd6));		  Patch<int>(base + OffsetJM("0x000A4150"), CFSwapInt32(0x0811f4a));		  Patch<int>(base + OffsetJM("0x000D6088"), CFSwapInt32(0x280101a4a));		  Patch<int>(base + OffsetJM("0x00011F44C"), CFSwapInt32(0x07000014));
		  Patch<int>(base + OffsetJM("0xBC5FC"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(base + OffsetJM("0xCE1C"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(base + OffsetJM("0x1B746C"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(base + OffsetJM("0xD044"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(base + OffsetJM("0x228CCC"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(base + OffsetJM("0xD618"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(base + OffsetJM("0x06D6B45E"), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x1BE8C0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x1BE9C8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x1BF0D0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x1BF4F8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x2096B4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x5B468"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x74F64"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x75170"), nullptr, 16), CFSwapInt32(0xC0035FD6));
		  Patch<int>(abc+std::stol(std::string("0x288191"), nullptr, 16), CFSwapInt32(0xC0035FD6));*/




    });
}
}

