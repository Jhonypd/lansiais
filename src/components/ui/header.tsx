'use client'

import { HomeIcon,  LogInIcon, LogOutIcon, MenuIcon,  } from "lucide-react";
import { Separator } from "./separator";
import { Sheet, SheetClose, SheetContent,SheetHeader,SheetTrigger } from "./sheet";
import { Button } from "./button";
import { Card } from "./card";
import { useSession } from "next-auth/react";
import { useContext } from "react";



const Header =()=>{
const {status, data}= useSession()
// const {produto}=useContext(filaContext)

return(
    <Card className="flex flex-row items-center justify-between p-[1.875rem]">
<Sheet>
    <SheetTrigger asChild>
        <Button variant={'outline'} size={'icon'}>
            <MenuIcon/></Button>
        </SheetTrigger>
</Sheet>
    </Card>
)
}

export default Header