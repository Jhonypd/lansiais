-- CreateEnum
CREATE TYPE "statusPonto" AS ENUM ('ativo', 'inativo');

-- CreateEnum
CREATE TYPE "UF" AS ENUM ('AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO');

-- CreateEnum
CREATE TYPE "StatusProposta" AS ENUM ('em_digitacao', 'reprovada', 'pendente', 'aprovada', 'efetivada', 'cancelada');

-- CreateEnum
CREATE TYPE "typeUser" AS ENUM ('master', 'gerencial', 'lider', 'digitador', 'analista');

-- CreateEnum
CREATE TYPE "ProductList" AS ENUM ('emprestimo_pessoal', 'GV', 'consignado', 'FGTS');

-- CreateEnum
CREATE TYPE "Prazo" AS ENUM ('um', 'dois', 'tres', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze');

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "PontoVenda" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "estado" "UF" NOT NULL,
    "status" "statusPonto" NOT NULL DEFAULT 'ativo',
    "responsavel" TEXT NOT NULL,
    "contato" TEXT NOT NULL,
    "_pontoId" TEXT NOT NULL,

    CONSTRAINT "PontoVenda_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Proposta" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "status" "StatusProposta" NOT NULL DEFAULT 'em_digitacao',
    "pontoVendaId" INTEGER NOT NULL,
    "usuarioId" INTEGER NOT NULL,

    CONSTRAINT "Proposta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "tipo" "typeUser" NOT NULL,
    "cidade" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Interacao" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "tipo" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "pontoVendaId" INTEGER NOT NULL,

    CONSTRAINT "Interacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Produto" (
    "id" SERIAL NOT NULL,
    "nome" "ProductList" NOT NULL,
    "productName" TEXT NOT NULL,
    "politica" TEXT NOT NULL,
    "taxa" DOUBLE PRECISION NOT NULL,
    "pontoVendaId" TEXT NOT NULL,
    "emprestimoId" INTEGER,

    CONSTRAINT "Produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Emprestimo" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "saque" DOUBLE PRECISION NOT NULL,
    "pontoVendaId" INTEGER NOT NULL,
    "taxa" DOUBLE PRECISION NOT NULL,
    "prazo" "Prazo" NOT NULL,
    "valorParcela" DOUBLE PRECISION,
    "productId" INTEGER,

    CONSTRAINT "Emprestimo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "PontoVenda_cnpj_key" ON "PontoVenda"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_cpf_key" ON "Usuario"("cpf");

-- AddForeignKey
ALTER TABLE "PontoVenda" ADD CONSTRAINT "PontoVenda__pontoId_fkey" FOREIGN KEY ("_pontoId") REFERENCES "Usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Proposta" ADD CONSTRAINT "Proposta_pontoVendaId_fkey" FOREIGN KEY ("pontoVendaId") REFERENCES "PontoVenda"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Proposta" ADD CONSTRAINT "Proposta_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interacao" ADD CONSTRAINT "Interacao_pontoVendaId_fkey" FOREIGN KEY ("pontoVendaId") REFERENCES "PontoVenda"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Produto" ADD CONSTRAINT "Produto_pontoVendaId_fkey" FOREIGN KEY ("pontoVendaId") REFERENCES "PontoVenda"("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emprestimo" ADD CONSTRAINT "Emprestimo_pontoVendaId_fkey" FOREIGN KEY ("pontoVendaId") REFERENCES "PontoVenda"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emprestimo" ADD CONSTRAINT "Emprestimo_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Produto"("id") ON DELETE SET NULL ON UPDATE CASCADE;
