import DateHelper from "@/app/utils/date_helper";
import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

const prisma = new PrismaClient();

export async function PUT(req: Request, { params }: { params: { client_id: string } }) {
    const { client_id } = params;
    const { name, address, phone_number, shop_name } = await req.json();


    console.log(client_id);
    
    const updatedFlour = await prisma.client.update({
      where: {
        id: +client_id,
      },
      data: {
        name,
        address,
        phone_number,
        shop_name,
        updated_at: DateHelper.getCurrentDate(),
      },
    });
    return NextResponse.json(updatedFlour, { status: 200 }); 
  }
  
  export async function DELETE(req: Request, { params }: { params: { client_id: string } }) {
    const { client_id } = params;
    await prisma.client.delete({ where: { id: +client_id } });
    return NextResponse.json({ message: 'Client deleted successfully' }, { status: 200 });
  }
  