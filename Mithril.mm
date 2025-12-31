#include <sys/mman.h>
#import <Foundation/Foundation.h>
#include <string>
#include <math.h>
#include <vector>
#include <dlfcn.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#import "1.h"
#import "2.h"
#import "ViewController.h"
static uintptr_t Mithril_GetModuleBase(const std::string& targetPath) {
    uint32_t count = _dyld_image_count();
    for (int i = 0; i < count; i++) {
        std::string path = (const char *)_dyld_get_image_name(i);
        if (path.find(targetPath) != path.npos) {
            return (uintptr_t)_dyld_get_image_vmaddr_slide(i);
        }
    }
    return 0;
}
static void Mithril_CleanTempFiles() {
    NSString *filepath9 = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/ano_tmp"];
    NSFileManager *fileManager9 = [NSFileManager defaultManager];
    [fileManager9 removeItemAtPath:filepath9 error:nil];

    NSString *filepath91 = [NSHomeDirectory() stringByAppendingPathComponent:@"/tmp"];
    NSFileManager *fileManager91 = [NSFileManager defaultManager];
    [fileManager91 removeItemAtPath:filepath91 error:nil];
}
template<typename T>
void Mithril_Patch(vm_address_t addr, T data, int size = 0) {
    if (size == 0) size = sizeof(T);

    vm_protect(mach_task_self(), (vm_address_t) addr, size, NO, VM_PROT_READ | VM_PROT_WRITE | VM_PROT_COPY);
    memcpy((void*)addr, &data, size);
    vm_protect(mach_task_self(), (vm_address_t)addr, size, NO, VM_PROT_READ | VM_PROT_EXECUTE);
}
__attribute__((constructor))
static void Mithril_Init() {
    Mithril_CleanTempFiles();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        uintptr_t abc1 = Mithril_GetModuleBase("ShadowTrackerExtra.app/Frameworks/anogs.framework/anogs");

        if (abc1 != 0) {
Mithril_Patch<int>(abc1+std::stol(std::string("0x4248"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x42BC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x4468"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x4524"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x4C18"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x4C1C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x4C20"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x4F48"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x5000"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x526C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6174"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6178"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x61D4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x61D8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x61DC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x61E0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6254"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6258"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x628C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6498"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6620"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x7904"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x85AC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8984"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8DFC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xADF4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB018"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xBE70"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xD7E0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xD8AC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xDA04"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xDA08"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xDA90"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x12820"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x14F0C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x14FB0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x156F8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15B24"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15D380"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15E40"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15F54"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x17470"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x18BD8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x19C5C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1A278"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1A2C40"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1B8F8C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1B8F94"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x24D110"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x2D92C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x2DC60"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x30028"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x32A98"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x33794"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x33D6C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x34FB8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x351E4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x35C34"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x39954"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x3A61C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x411F8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x42740"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x455F0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x46588"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x466AC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x468CC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x488B8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x59F58"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x5A084"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x68DF0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x68E5C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x68FB0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x69118"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x692A4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x69354"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6A828"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6A9C8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6AEE8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6B024"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6B400"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6B480"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6B500"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6B550"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x6B5A0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x7437C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x74B00"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x74DD0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x75F98"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x76388"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x79D2C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x7B690"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x7B748"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8A8F8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8A8FC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8B9B0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8D6F8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8F814"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x8FA18"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x9A790"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x9A80C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x9AA48"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x9AD34"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x9ADAC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x9D7DC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xA231C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xA8284"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xAB488"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xACCA8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xACEEC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xAD19C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xADA28"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xADCB0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xAE1CC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xAE708"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xAF120"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xAFF80"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB4354"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB43B4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB44C8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB4684"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB4864"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB4BC4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB4C58"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xB5B28"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xD6E78"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xDBFEC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xE19A0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xE1CFC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xE1FBC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xEE280"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF0490"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF745C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF791C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7A30"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7C54"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7CDC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7D54"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7D5C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7EDC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF7F70"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF8030"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF806C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF80A8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF8148"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF8210"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF829C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF8324"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF8350"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0xF838C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x10CA80"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x120A0C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1279FC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1296AC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x12A140"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x13AC90"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x147F88"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x148750"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x148804"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x148ABC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x148B48"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x159F00"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15A2E4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15A8E0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15BAA8"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15BAAC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x15BBE4"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x162050"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x16FBF0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x180F84"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x182908"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x185A9C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x185FE0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x186008"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x18961C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x189DF0"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1B7534"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1BC348"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x1EE3EC"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x202B5C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
Mithril_Patch<int>(abc1+std::stol(std::string("0x23A250"), nullptr, 16), CFSwapInt32(0xC0035FD6));
        
        }
    });
}