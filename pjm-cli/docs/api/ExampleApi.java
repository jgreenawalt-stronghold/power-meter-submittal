package com.pjm.web.cli.api;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Arrays;

import com.pjm.web.cli.api.PjmRemoteCommand;
import com.pjm.web.cli.api.PjmResult;
import com.pjm.web.cli.http.PjmClient;

/**
 * PJM API ExampleApi to show how the API is used to perform a file upload and
 * file downloads that don't need to be downloaded to a file can be downloaded
 * to any OutputStream interface such as ByteArrayOutputStream for example.
 * 
 * @author <a href="mailto:elefkof@ksmpartners.com">Emil Lefkof</a>
 */
public class ExampleApi {

   /**
    * Main method executes this class.
    *
    * @param args the command line arguments
    */
   public static void main(final String[] args) {

      // example download call to memory
      downloadToMemory();

      // example download call to file
      // downloadToFile();

      // example upload call
      // upload();
   }

   /**
    * Example call to download a file from PJM into a ByteArrayOutputStream in
    * memory if you did not want to write the results to disk.
    */
   public static void downloadToMemory() {
      try {
         final PjmRemoteCommand command = new PjmRemoteCommand();

         command.setServiceUrl("https://inschedtrain.pjm.com/inschedule/");
         command.setUsername("test");
         command.setPassword("Test1234$");
         command.setLogLevel("INFO");
         command.setCsvToXml(false);

         // the URL action you want to execute
         command.setAction("/rest/secure/download/csv/schedules");

         // any query parameters required by the download
         command.getQueryParams().put("start", Arrays.asList(new String[] { "10-01-2012" }));
         command.getQueryParams().put("stop", Arrays.asList(new String[] { "12-31-2012" }));

         // create an output stream to capture the output result
         final ByteArrayOutputStream baos = new ByteArrayOutputStream();
         command.setOutputStream(baos);

         // execute the command and inspect the results
         final PjmResult result = PjmClient.execute(command);

         if (result.getResultCode() == PjmResult.CLI_SUCCESS) {
            System.out.println("Download succeeded for file: " + result.getFileName());
         } else {
            System.out.println("Download failed for file: " + result.getFileName());
         }

         // now you can inspect or manipulate the Outputstream results
         final String output = new String(baos.toByteArray());
         System.out.println(output);
      } catch (final Exception ex) {
         ex.printStackTrace();
      }
   }

   /**
    * Example call to download a file from PJM into a FileOutputStream to save
    * the results to disk.
    */
   public static void downloadToFile() {
      try {
         final PjmRemoteCommand command = new PjmRemoteCommand();
         command.setServiceUrl("https://inschedtrain.pjm.com/inschedule/");
         command.setUsername("test");
         command.setPassword("Test1234$");

         // the URL action you want to execute
         command.setAction("/rest/secure/download/csv/contracts");

         // any query parameters required by the download
         command.getQueryParams().put("start", Arrays.asList(new String[] { "01-01-2012" }));
         command.getQueryParams().put("stop", Arrays.asList(new String[] { "01-31-2012" }));

         // create an output stream to capture the output result
         final File file = new File("my-output-file.csv");
         final FileOutputStream fos = new FileOutputStream(file);

         // buffer the stream for performance
         final BufferedOutputStream bos = new BufferedOutputStream(fos);
         command.setOutputStream(bos);

         // execute the command and inspect the results
         final PjmResult result = PjmClient.execute(command);

         if (result.getResultCode() == PjmResult.CLI_SUCCESS) {
            System.out.println("Download succeeded for file: " + result.getFileName());
         } else {
            System.out.println("Download failed for file: " + result.getFileName());
         }
      } catch (final Exception ex) {
         ex.printStackTrace();
      }
   }

   /**
    * Uploads a file from disk to the PJM Servers.
    */
   public static void upload() {
      try {
         final PjmRemoteCommand command = new PjmRemoteCommand();
         command.setServiceUrl("https://inschedtrain.pjm.com/inschedule/");
         command.setUsername("test");
         command.setPassword("Test1234$");
         // the URL action you want to execute
         command.setAction("/rest/secure/upload/file/");

         // a file upload requires an InputStream. It can be from a File like
         // this example, an in memory stream, or any other way of producing an
         // InputStream. The UploadFileName is purely a name for the server to
         // receive for logging purposes
         final File file = new File("./src/test/resources/my-upload.txt");
         command.setUploadFileName(file.getName());
         command.setInputStream(new FileInputStream(file));
         command.setOutputFileName("result.txt");

         // create an output stream to capture the output result
         final ByteArrayOutputStream baos = new ByteArrayOutputStream();
         command.setOutputStream(baos);

         // execute the command and inspect the results
         final PjmResult result = PjmClient.execute(command);

         if (result.getResultCode() == PjmResult.CLI_SUCCESS) {
            System.out.println("Upload succeeded for file: " + result.getFileName());
         } else {
            System.out.println("Upload failed for file: " + result.getFileName());
         }

         // now you can inspect or manipulate the Outputstream results
         final String output = new String(baos.toByteArray());
         System.out.println(output);

      } catch (final Exception ex) {
         ex.printStackTrace();
      }
   }

}
