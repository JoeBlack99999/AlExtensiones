// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

//https://businesscentral.dynamics.com/2c206f92-0a9f-4f29-a69c-4440a7ff5d53/admin

pageextension 50102 EmployeeList extends 5201
{
    trigger OnOpenPage();
    begin
        Message('Aplicación Extensión Página (Lista de Empleados): Hello world Jose Nieto Encinas');

        /*  
          SMTPMailSetup.GET;
          MESSAGE(SMTPMailSetup."User ID");
          SMTPMail.CreateMessage('test object', SMTPMailSetup."User ID", 'metest@gmail.com', 'test', 'some text body', FALSE);
          SMTPMail.Send;
          MESSAGE('Mail Sent');
       */

    end;



}