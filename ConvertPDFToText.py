import PyPDF2
pdfFileObj = open(r'C:\Users\bdm.oag-9276\Desktop\IEMA FY16 Additions Deletions.pdf','rb')
pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
num_pages = pdfReader.numPages
fy17File = open(r'C:\Users\bdm.oag-9276\Desktop\IEMA FY16.txt','a')
for i in range(0,num_pages):
	pageobj=pdfReader.getPage(i)
	page = pageobj.extractText()
	fy17File.write(page)

print("Complete")