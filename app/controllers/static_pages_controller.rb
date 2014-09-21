class StaticPagesController < ApplicationController

  #include PdfController

  require 'rjb'
  Rjb::load("lib/itext-5.5.2/itextpdf-5.5.2.jar")
  
  def stamp
    pdfWriterClass = Rjb::import("com.itextpdf.text.pdf.PdfWriter")
    documentClass = Rjb::import("com.itextpdf.text.Document")
    byteArrayClass = Rjb::import("java.io.ByteArrayOutputStream")
    paragraphClass = Rjb::import("com.itextpdf.text.Paragraph")
    byteArrayInstance = byteArrayClass.new()
    pdf_document = documentClass.new()
    pdf_writer = pdfWriterClass.getInstance(pdf_document, byteArrayInstance)
    pdf_document.open()
    pdf_document.add(paragraphClass.new("Hello!"))
    pdf_document.close()
    fileInBytes = byteArrayInstance.toByteArray()
    send_data(fileInBytes, :filename => "pdf/hello.pdf", :type => "application/pdf")
  end

  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    #stamp
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
