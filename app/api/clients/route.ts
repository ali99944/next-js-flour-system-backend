import DateHelper from '@/app/utils/date_helper';
import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';

const prisma = new PrismaClient();

export async function GET(req: Request) {
  const clients = await prisma.client.findMany();
  return NextResponse.json(clients, { status: 200 });
}

export async function POST(req: Request) {
  const { name, address, phone_number, shop_name } = await req.json();
  
  
  const newFlour = await prisma.client.create({ 
    data: {
      name,
      address,
      phone_number,
      shop_name,
      created_at: DateHelper.getCurrentDate(),
    }
    });
  return NextResponse.json(newFlour, { status: 201 });
}

