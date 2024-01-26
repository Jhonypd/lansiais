'use client'

import { BellIcon, CircleDollarSign, FilePenLine, FilePieChartIcon, FileText, HomeIcon,  LineChartIcon,  LogInIcon, LogOutIcon, MenuIcon,  } from "lucide-react";
import { Separator } from "./separator";
import { Sheet, SheetClose, SheetContent,SheetHeader,SheetTrigger } from "./sheet";
import { Button } from "./button";
import { Card } from "./card";
import { useSession } from "next-auth/react";
import { useContext } from "react";
import { Avatar, AvatarFallback, AvatarImage } from "./avatar";
import Link from "next/link";
import { Accordion, AccordionContent } from "@radix-ui/react-accordion";
import { AccordionItem, AccordionTrigger } from "./accordion";



const Header =()=>{
const {status, data}= useSession()
// const {produto}=useContext(filaContext)

return(
    <Card className="flex flex-row items-center justify-between p-[1.875rem]">
        <Sheet>
            <SheetTrigger asChild>
                <Button variant={'outline'} size={'icon'}>
                    <MenuIcon/>
                </Button>
            </SheetTrigger>
            <SheetContent side={'left'} className="w-[19.875rem]">
                <SheetHeader className=" text-left text-lg font-semibold ">
                    Menu
                </SheetHeader>
                <div className="flex flex-col">
                    <div className="flex item-center gap-2 py-4">
                        <Avatar>
                            <AvatarFallback>Master</AvatarFallback>
                            <AvatarImage src='https://github.com/shadcn.png' />
                        </Avatar>
                        <div className="flex flex-col">
                            <p className="font-medium">Master</p>
                            <p className="text-sm opacity-75">Bem vindo!</p>
                        </div>
                    </div>
                    <Separator/>
                </div>
                <div className="flex flex-col justify-between ">
                <div className=" flex flex-col gap-4 mt-2">
                    <SheetClose asChild>
                        <Link href={'/'}>
                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                <HomeIcon size={16}/> Inicio
                            </Button>
                        </Link>
                    </SheetClose>
                    <SheetClose asChild>
                        <Link href={'/'}>
                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                <FileText size={16}/> Propostas
                            </Button>
                        </Link>
                    </SheetClose>
                    <SheetClose asChild>
                        <Link href={'/'}>
                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                <FilePenLine  size={16}/> Contratos
                            </Button>
                        </Link>
                    </SheetClose>
                    <SheetClose asChild>
                        <Link href={'/'}>
                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                <CircleDollarSign size={16}/> Vendas
                            </Button>
                        </Link>
                    </SheetClose>
                            <Accordion type="single" collapsible className="w-full">
                                <AccordionItem value="item-1">
                                    <AccordionTrigger >
                                    <SheetClose asChild>
                                        <Link href={'#'} className="w-[80%]">
                                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                                <LineChartIcon size={16}/> Relatórios
                                            </Button>
                                        </Link>
                                    </SheetClose>
                                    </AccordionTrigger>
                                    <AccordionContent>
                                    <SheetClose asChild>
                                        <Link href={'#'} className="w-[90%]">
                                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                                 Individual
                                            </Button>
                                        </Link>
                                        <Link href={'#'} className="w-[90%]">
                                            <Button variant={"outline"} className="w-full justify-start gap-2">
                                                 Geral
                                            </Button>
                                        </Link>
                                    </SheetClose>
                                    </AccordionContent>
                                </AccordionItem>
                            </Accordion>
                </div>
                <div className="mb-4 flex flex-col gap-4">
                    <Separator/>
                    
                    <Button variant={"outline"} className="w-full justify-start gap-2">
                        <LogInIcon size={16}/>
                        Fazer login
                    </Button>
                    {/* <Button variant={"outline"} className="w-full justify-start gap-2">
                        <LogOutIcon size={16}/>
                        Fazer login
                    </Button> */}
                    <Separator/>
                </div>
                </div>
            </SheetContent>
        </Sheet>
        <Link href="/">
        <h1 className="text-lg font-semibold">
          <span className="text-primary">Jhony</span> Cred
        </h1>
      </Link>

      <Sheet>
        <SheetTrigger asChild>
          <Button size="icon" variant="outline" className="relative">
              <span className="absolute right-[calc(-1.25rem/2)] top-[calc(-1.25rem/2)] flex h-6 w-6 items-center justify-center rounded-lg bg-primary text-sm font-bold text-white">
                1
              </span>
            
            <BellIcon />
          </Button>
        </SheetTrigger>

        <SheetContent className="w-[350px] lg:w-[600px] lg:max-w-[600px]">
          <SheetHeader>
            Notficações
          </SheetHeader>
          <Separator className="mt-2"/>
        </SheetContent>
      </Sheet>
    </Card>
)
}

export default Header