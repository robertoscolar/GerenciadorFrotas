
USE GerenciadorFrotas
GO 


insert tblSexo(descricao)
values 
('Masculino'),
('Feminino')


insert tblStatus 
(descricao)
values
('Ativo'),('Inativo')

insert tblUsuario 
(login,nome,email,senha,ativo)
values
('adm_@frotas','adm_adm','adm@adm.com.br','b09c600fddc573f117449b3723f23d64',1),
('arnaldo_@frotas','arnaldo_cesar_coelho','gerente@frota.com.br','cef0712f8fd489562f63d849a16cf4cc',1),
('galvao_bueno@frotas','galvao_bueno','gerente02@frota.com.br','cef0712f8fd489562f63d849a16cf4cc',1),
('drake_@frotas','drake_Aubrey','gerente03@frota.com.br','cef0712f8fd489562f63d849a16cf4cc',1)


insert tblColaborador   
(nome,cpf,email,dataAdmissao,
celular,sexoId,statusId,usuarioId)
values
('Elon_Musk','15489765412','elon_doidin@frota.com.br','2024-02-06','11999999990',1,1,3),
('Usain Bolt','15879462331','usain_rapido@frota.com.br','2024-06-01','11965481763',1,1,1),
('Cristiano Ronaldo','124567890','pulou_simmmmm@frota.com.br','2023-05-08','11987856245',1,1,2),
('Michael Jordan','58962514278','jordan_cestinhA@fota.com.br','2022-06-02','11987456332',1,1,3),
('Pele','98745612345','filme_do_pele@frota.com.br','2022-06-02','15965897458',1,1,1),
('Serena_Williams','11654897254','atrizserena@frota.com.br','2017-12-05','18956234785',1,1,3)


insert tblCategoria
(descricao,dataCadastro)
values
('onibus',2024-02-01),('Motocicleta',2024-02-01),('carro',2024-02-01),('van',2024-02-01),('caminhao',2024-02-01)

insert tblOficina
(razaoSocial,nomeFantasia,cnpj,email,urlSite,telefone,usuarioId)
values
('Auto Pecas Martins Ltda','Martins Auto Parts','65432109000176','contato@martinsautoparts.com','http://www.martinsautoparts.com','(51) 6543-2109','2'),
('Centro Automotivo Almeida & Filhos Ltda','Almeida Auto Center','76543210000187','contato@almeidaautocenter.com','http://www.almeidaautocenter.com.br','(41) 7654-3210','2'),
('Reparacaoo Automotiva Oliveira Ltda','Oliveira Auto Service','87654321000154','contato@oliveiraautoservice.com','http://www.oliveiraautoservice.com','(31) 8765-4321','3'),
('Mecanica Rapida Santos S.A.','Mecanica Santos','98765432000121','contato@mecanicasantos.com','http://www.mecanicasantos.com.br','(21) 9876-5432','1'),
('Auto Mecanica Silva Ltda','Silva Auto Center','12345678000190','contato@silvaautocenter.com','http://www.silvaautocenter.com','(11) 1234-5678','1')

insert tblMarca(nome,dataCadastro)
values 
('Fiat', SYSDATETIME()),('Chevrolet',SYSDATETIME()),('Volkswagen',SYSDATETIME()),('Hyundai',SYSDATETIME()),('Toyota',SYSDATETIME()),
('Honda',SYSDATETIME()),('Yamaha',SYSDATETIME()),('BMW',SYSDATETIME()),('Kawasaki',SYSDATETIME()),('Mercedes-Benz',SYSDATETIME()),
('Ford',SYSDATETIME()),('Renault',SYSDATETIME()),('Peugeot',SYSDATETIME()),('Scania',SYSDATETIME()),('Volvo',SYSDATETIME())


insert tblModelo (nome,ano,dataCadastro,marcaId,categoriaId) 
values
('CG Cargo',2022,SYSDATETIME(),6,2),('XTZ Crosser',2020,SYSDATETIME(),7,2),('Versys 650r',2023,SYSDATETIME(),9,2),('Onix',2021,SYSDATETIME(),2,1),
('Argo',2023,SYSDATETIME(),1,1),('HB20',2020,SYSDATETIME(),4,1),('Actros',2022,SYSDATETIME(),10,3),('Constellation',2021,SYSDATETIME(),3,3),
('FH',2020,SYSDATETIME(),15,3),('R 450',2019,SYSDATETIME(),14,3),('Sprinter',2020,SYSDATETIME(),10,4),('Ducato',2024,SYSDATETIME(),1,4),
('Master',2024,SYSDATETIME(),12,4),('OF 1721 L',2024,SYSDATETIME(),10,5),('B270F',2024,SYSDATETIME(),15,5)

insert tblVeiculo (placa,chassi,quilometragemAtual,quilometragemInicial,ativo,usuarioId,modeloId)
values
('THR0022','48321907845632100',0,0,1,1,4),('BLZ0003','76543210897654321',0,0,1,2,6),('OMG0010','12345678901234567',0,0,1,3,8),
('STL5009','98765432109876543',0,0,1,1,10),('GAL1008','24680135792468013',0,0,1,1,11),('VEN5007','57913579024681357',0,0,1,2,8),
('FLX9004','13579024681357913',0,0,1,3,10),('FLX1514','80246813579024680',0,0,1,3,11),('BLZ7803','79024681357902468',0,0,1,3,14),
('CRN5006','24681357902468013',0,0,1,2,15),('FTY001','13579024681357902',0,0,1,3,12)

insert tblEnderecoOficina (logradouro,numero,complemento,bairro,cep,referencia,cidadeId,oficinaId)
values
('Rua_das_Estrelas',123,'Bloco A','Jardim Celestial','12345678','Proximo a Via Lactea',5370,2),
('Avenida das Flores',456,'Sala 202','Primavera Park','54321987','Parque das arvores',5370,3),
('Travessa dos Passarinhos',789,'Casa Azul','Cantinho do Bosque','98765432','Ao lado da lagoa dos cisnes',5370,4),
('Rua do Sol Nascente',1011,'','Aurora Boreal','87654321','Proximo a montanha de cristal',5370,5)

insert tblControle (dataSaida,dataEntrada,concluido,usuarioId,colaboradorId,veiculoId)
values
(SYSDATETIME(),SYSDATETIME(),1,1,3,5),(SYSDATETIME(),SYSDATETIME(),2,2,4,7),
(SYSDATETIME(),SYSDATETIME(),1,3,5,10)

insert tblManutencao (descricao,orcamento,oficinaid,veiculoid)  
values
('','10000',1,5),('','5000',2,7),('','15000',3,10),('','7000',4,11),('','2000',5,8)