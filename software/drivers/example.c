#include <linux/module.h>
#include <linux/init.h>

int my_init(void){
   printk("example module loaded!\n");
   return 0;
}

void my_exit(void){
   printk("Unloaded!\n");
}

module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");
