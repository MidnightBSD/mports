/* Generated */

#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include <libxml/xmlversion.h>
#include <libxml/tree.h>
#include <libxml/xmlschemastypes.h>
#include "libxml_wrap.h"
#include "libxml2-py.h"

#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlAutoCloseTag(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (libxml_deprecationWarning("htmlAutoCloseTag") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OzO:htmlAutoCloseTag", &pyobj_doc, &name, &pyobj_elem))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = htmlAutoCloseTag(doc, name, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCreateFileParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    htmlParserCtxt * c_retval;
    char * filename;
    char * encoding;

    if (!PyArg_ParseTuple(args, "zz:htmlCreateFileParserCtxt", &filename, &encoding))
        return(NULL);

    c_retval = htmlCreateFileParserCtxt(filename, encoding);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCreateMemoryParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    htmlParserCtxt * c_retval;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;

    if (!PyArg_ParseTuple(args, "s#i:htmlCreateMemoryParserCtxt", &buffer, &py_buffsize0, &size))
        return(NULL);

    c_retval = htmlCreateMemoryParserCtxt(buffer, size);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
#endif
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtReadDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * cur;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozzzi:htmlCtxtReadDoc", &pyobj_ctxt, &cur, &URL, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlCtxtReadDoc(ctxt, cur, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtReadFd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int fd;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Oizzi:htmlCtxtReadFd", &pyobj_ctxt, &fd, &URL, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlCtxtReadFd(ctxt, fd, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtReadFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * filename;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozzi:htmlCtxtReadFile", &pyobj_ctxt, &filename, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlCtxtReadFile(ctxt, filename, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtReadMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Os#izzi:htmlCtxtReadMemory", &pyobj_ctxt, &buffer, &py_buffsize0, &size, &URL, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlCtxtReadMemory(ctxt, buffer, size, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtReset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:htmlCtxtReset", &pyobj_ctxt))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    htmlCtxtReset(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtSetOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "Oi:htmlCtxtSetOptions", &pyobj_ctxt, &options))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlCtxtSetOptions(ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlCtxtUseOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "Oi:htmlCtxtUseOptions", &pyobj_ctxt, &options))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlCtxtUseOptions(ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlDefaultSAXHandlerInit(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("htmlDefaultSAXHandlerInit") == -1)
        return(NULL);

    htmlDefaultSAXHandlerInit();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlDocContentDumpFormatOutput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlOutputBuffer * buf;
    PyObject *pyobj_buf;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    char * encoding;
    int format;

    if (!PyArg_ParseTuple(args, "OOzi:htmlDocContentDumpFormatOutput", &pyobj_buf, &pyobj_cur, &encoding, &format))
        return(NULL);
    buf = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_buf);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    htmlDocContentDumpFormatOutput(buf, cur, encoding, format);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlDocContentDumpOutput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlOutputBuffer * buf;
    PyObject *pyobj_buf;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    char * encoding;

    if (!PyArg_ParseTuple(args, "OOz:htmlDocContentDumpOutput", &pyobj_buf, &pyobj_cur, &encoding))
        return(NULL);
    buf = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_buf);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    htmlDocContentDumpOutput(buf, cur, encoding);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlDocDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    FILE * f;
    PyObject *pyobj_f;
    xmlDoc * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:htmlDocDump", &pyobj_f, &pyobj_cur))
        return(NULL);
    f = (FILE *) PyFile_Get(pyobj_f);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = htmlDocDump(f, cur);
    PyFile_Release(f);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlFreeParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:htmlFreeParserCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    htmlFreeParserCtxt(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlGetMetaEncoding(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:htmlGetMetaEncoding", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = htmlGetMetaEncoding(doc);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlHandleOmittedElem(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int val;

    if (libxml_deprecationWarning("htmlHandleOmittedElem") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:htmlHandleOmittedElem", &val))
        return(NULL);

    c_retval = htmlHandleOmittedElem(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlInitAutoClose(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("htmlInitAutoClose") == -1)
        return(NULL);

    htmlInitAutoClose();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlIsAutoClosed(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (libxml_deprecationWarning("htmlIsAutoClosed") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:htmlIsAutoClosed", &pyobj_doc, &pyobj_elem))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = htmlIsAutoClosed(doc, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlIsBooleanAttr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * name;

    if (libxml_deprecationWarning("htmlIsBooleanAttr") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:htmlIsBooleanAttr", &name))
        return(NULL);

    c_retval = htmlIsBooleanAttr(name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlIsScriptAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * name;

    if (libxml_deprecationWarning("htmlIsScriptAttribute") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:htmlIsScriptAttribute", &name))
        return(NULL);

    c_retval = htmlIsScriptAttribute(name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlNewDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * URI;
    xmlChar * ExternalID;

    if (!PyArg_ParseTuple(args, "zz:htmlNewDoc", &URI, &ExternalID))
        return(NULL);

    c_retval = htmlNewDoc(URI, ExternalID);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlNewDocNoDtD(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * URI;
    xmlChar * ExternalID;

    if (!PyArg_ParseTuple(args, "zz:htmlNewDocNoDtD", &URI, &ExternalID))
        return(NULL);

    c_retval = htmlNewDocNoDtD(URI, ExternalID);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlNewParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    htmlParserCtxt * c_retval;

    c_retval = htmlNewParserCtxt();
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlNodeDumpFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * out;
    PyObject *pyobj_out;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OOO:htmlNodeDumpFile", &pyobj_out, &pyobj_doc, &pyobj_cur))
        return(NULL);
    out = (FILE *) PyFile_Get(pyobj_out);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    htmlNodeDumpFile(out, doc, cur);
    PyFile_Release(out);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlNodeDumpFileFormat(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    FILE * out;
    PyObject *pyobj_out;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;
    char * encoding;
    int format;

    if (!PyArg_ParseTuple(args, "OOOzi:htmlNodeDumpFileFormat", &pyobj_out, &pyobj_doc, &pyobj_cur, &encoding, &format))
        return(NULL);
    out = (FILE *) PyFile_Get(pyobj_out);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = htmlNodeDumpFileFormat(out, doc, cur, encoding, format);
    PyFile_Release(out);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlNodeDumpFormatOutput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlOutputBuffer * buf;
    PyObject *pyobj_buf;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;
    char * encoding;
    int format;

    if (!PyArg_ParseTuple(args, "OOOzi:htmlNodeDumpFormatOutput", &pyobj_buf, &pyobj_doc, &pyobj_cur, &encoding, &format))
        return(NULL);
    buf = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_buf);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    htmlNodeDumpFormatOutput(buf, doc, cur, encoding, format);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlNodeDumpOutput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlOutputBuffer * buf;
    PyObject *pyobj_buf;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;
    char * encoding;

    if (!PyArg_ParseTuple(args, "OOOz:htmlNodeDumpOutput", &pyobj_buf, &pyobj_doc, &pyobj_cur, &encoding))
        return(NULL);
    buf = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_buf);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    htmlNodeDumpOutput(buf, doc, cur, encoding);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlParseCharRef(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("htmlParseCharRef") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:htmlParseCharRef", &pyobj_ctxt))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlParseCharRef(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_PUSH_ENABLED)
PyObject *
libxml_htmlParseChunk(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * chunk;
    Py_ssize_t  py_buffsize0;
    int size;
    int terminate;

    if (!PyArg_ParseTuple(args, "Os#ii:htmlParseChunk", &pyobj_ctxt, &chunk, &py_buffsize0, &size, &terminate))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlParseChunk(ctxt, chunk, size, terminate);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_PUSH_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlParseDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * cur;
    char * encoding;

    if (!PyArg_ParseTuple(args, "zz:htmlParseDoc", &cur, &encoding))
        return(NULL);

    c_retval = htmlParseDoc(cur, encoding);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlParseDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:htmlParseDocument", &pyobj_ctxt))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = htmlParseDocument(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_htmlParseElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    htmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("htmlParseElement") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:htmlParseElement", &pyobj_ctxt))
        return(NULL);
    ctxt = (htmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    htmlParseElement(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlParseFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * filename;
    char * encoding;

    if (!PyArg_ParseTuple(args, "zz:htmlParseFile", &filename, &encoding))
        return(NULL);

    c_retval = htmlParseFile(filename, encoding);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlReadDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * cur;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zzzi:htmlReadDoc", &cur, &URL, &encoding, &options))
        return(NULL);

    c_retval = htmlReadDoc(cur, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlReadFd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    int fd;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "izzi:htmlReadFd", &fd, &URL, &encoding, &options))
        return(NULL);

    c_retval = htmlReadFd(fd, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlReadFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zzi:htmlReadFile", &URL, &encoding, &options))
        return(NULL);

    c_retval = htmlReadFile(URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlReadMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "s#izzi:htmlReadMemory", &buffer, &py_buffsize0, &size, &URL, &encoding, &options))
        return(NULL);

    c_retval = htmlReadMemory(buffer, size, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
#endif
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlSaveFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "zO:htmlSaveFile", &filename, &pyobj_cur))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = htmlSaveFile(filename, cur);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlSaveFileEnc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    char * encoding;

    if (!PyArg_ParseTuple(args, "zOz:htmlSaveFileEnc", &filename, &pyobj_cur, &encoding))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = htmlSaveFileEnc(filename, cur, encoding);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_htmlSaveFileFormat(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    char * encoding;
    int format;

    if (!PyArg_ParseTuple(args, "zOzi:htmlSaveFileFormat", &filename, &pyobj_cur, &encoding, &format))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = htmlSaveFileFormat(filename, cur, encoding, format);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_HTML_ENABLED)
PyObject *
libxml_htmlSetMetaEncoding(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * encoding;

    if (!PyArg_ParseTuple(args, "Oz:htmlSetMetaEncoding", &pyobj_doc, &encoding))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = htmlSetMetaEncoding(doc, encoding);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_HTML_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogAdd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    xmlChar * type;
    xmlChar * orig;
    xmlChar * replace;

    if (libxml_deprecationWarning("xmlACatalogAdd") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Ozzz:xmlACatalogAdd", &pyobj_catal, &type, &orig, &replace))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlACatalogAdd(catal, type, orig, replace);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    FILE * out;
    PyObject *pyobj_out;

    if (libxml_deprecationWarning("xmlACatalogDump") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:xmlACatalogDump", &pyobj_catal, &pyobj_out))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);
    out = (FILE *) PyFile_Get(pyobj_out);

    xmlACatalogDump(catal, out);
    PyFile_Release(out);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogRemove(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    xmlChar * value;

    if (libxml_deprecationWarning("xmlACatalogRemove") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oz:xmlACatalogRemove", &pyobj_catal, &value))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlACatalogRemove(catal, value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogResolve(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    xmlChar * pubID;
    xmlChar * sysID;

    if (libxml_deprecationWarning("xmlACatalogResolve") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Ozz:xmlACatalogResolve", &pyobj_catal, &pubID, &sysID))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlACatalogResolve(catal, pubID, sysID);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogResolvePublic(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    xmlChar * pubID;

    if (libxml_deprecationWarning("xmlACatalogResolvePublic") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oz:xmlACatalogResolvePublic", &pyobj_catal, &pubID))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlACatalogResolvePublic(catal, pubID);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogResolveSystem(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    xmlChar * sysID;

    if (libxml_deprecationWarning("xmlACatalogResolveSystem") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oz:xmlACatalogResolveSystem", &pyobj_catal, &sysID))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlACatalogResolveSystem(catal, sysID);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlACatalogResolveURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;
    xmlChar * URI;

    if (libxml_deprecationWarning("xmlACatalogResolveURI") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oz:xmlACatalogResolveURI", &pyobj_catal, &URI))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlACatalogResolveURI(catal, URI);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
PyObject *
libxml_xmlAddChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlAddChild", &pyobj_parent, &pyobj_cur))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlAddChild(parent, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlAddChildList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlAddChildList", &pyobj_parent, &pyobj_cur))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlAddChildList(parent, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlAddDocEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    int type;
    xmlChar * publicId;
    xmlChar * systemId;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Ozizzz:xmlAddDocEntity", &pyobj_doc, &name, &type, &publicId, &systemId, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlAddDocEntity(doc, name, type, publicId, systemId, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlAddDtdEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    int type;
    xmlChar * publicId;
    xmlChar * systemId;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Ozizzz:xmlAddDtdEntity", &pyobj_doc, &name, &type, &publicId, &systemId, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlAddDtdEntity(doc, name, type, publicId, systemId, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlAddEncodingAlias(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * name;
    char * alias;

    if (libxml_deprecationWarning("xmlAddEncodingAlias") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "zz:xmlAddEncodingAlias", &name, &alias))
        return(NULL);

    c_retval = xmlAddEncodingAlias(name, alias);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlAddIDSafe(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlAttr * attr;
    PyObject *pyobj_attr;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "Oz:xmlAddIDSafe", &pyobj_attr, &value))
        return(NULL);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    c_retval = xmlAddIDSafe(attr, value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlAddNextSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OO:xmlAddNextSibling", &pyobj_cur, &pyobj_elem))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlAddNextSibling(cur, elem);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlAddPrevSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OO:xmlAddPrevSibling", &pyobj_cur, &pyobj_elem))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlAddPrevSibling(cur, elem);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlAddSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OO:xmlAddSibling", &pyobj_cur, &pyobj_elem))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlAddSibling(cur, elem);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlBuildQName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * ncname;
    xmlChar * prefix;
    xmlChar * memory;
    int len;

    if (!PyArg_ParseTuple(args, "zzzi:xmlBuildQName", &ncname, &prefix, &memory, &len))
        return(NULL);

    c_retval = xmlBuildQName(ncname, prefix, memory, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlBuildRelativeURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * URI;
    xmlChar * base;

    if (!PyArg_ParseTuple(args, "zz:xmlBuildRelativeURI", &URI, &base))
        return(NULL);

    c_retval = xmlBuildRelativeURI(URI, base);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlBuildURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * URI;
    xmlChar * base;

    if (!PyArg_ParseTuple(args, "zz:xmlBuildURI", &URI, &base))
        return(NULL);

    c_retval = xmlBuildURI(URI, base);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlByteConsumed(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    long c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlByteConsumed") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlByteConsumed", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlByteConsumed(ctxt);
    py_retval = libxml_longWrap((long) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlCanonicPath(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * path;

    if (!PyArg_ParseTuple(args, "z:xmlCanonicPath", &path))
        return(NULL);

    c_retval = xmlCanonicPath(path);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogAdd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * type;
    xmlChar * orig;
    xmlChar * replace;

    if (!PyArg_ParseTuple(args, "zzz:xmlCatalogAdd", &type, &orig, &replace))
        return(NULL);

    c_retval = xmlCatalogAdd(type, orig, replace);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogCleanup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlCatalogCleanup();
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_SGML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCatalogConvert(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    int c_retval;

    if (libxml_deprecationWarning("xmlCatalogConvert") == -1)
        return(NULL);

    c_retval = xmlCatalogConvert();
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SGML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlCatalogDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * out;
    PyObject *pyobj_out;

    if (!PyArg_ParseTuple(args, "O:xmlCatalogDump", &pyobj_out))
        return(NULL);
    out = (FILE *) PyFile_Get(pyobj_out);

    xmlCatalogDump(out);
    PyFile_Release(out);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCatalogGetPublic(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlChar * pubID;

    if (libxml_deprecationWarning("xmlCatalogGetPublic") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlCatalogGetPublic", &pubID))
        return(NULL);

    c_retval = xmlCatalogGetPublic(pubID);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCatalogGetSystem(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlChar * sysID;

    if (libxml_deprecationWarning("xmlCatalogGetSystem") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlCatalogGetSystem", &sysID))
        return(NULL);

    c_retval = xmlCatalogGetSystem(sysID);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCatalogIsEmpty(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;

    if (libxml_deprecationWarning("xmlCatalogIsEmpty") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlCatalogIsEmpty", &pyobj_catal))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlCatalogIsEmpty(catal);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogRemove(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlCatalogRemove", &value))
        return(NULL);

    c_retval = xmlCatalogRemove(value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogResolve(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * pubID;
    xmlChar * sysID;

    if (!PyArg_ParseTuple(args, "zz:xmlCatalogResolve", &pubID, &sysID))
        return(NULL);

    c_retval = xmlCatalogResolve(pubID, sysID);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogResolvePublic(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * pubID;

    if (!PyArg_ParseTuple(args, "z:xmlCatalogResolvePublic", &pubID))
        return(NULL);

    c_retval = xmlCatalogResolvePublic(pubID);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogResolveSystem(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * sysID;

    if (!PyArg_ParseTuple(args, "z:xmlCatalogResolveSystem", &sysID))
        return(NULL);

    c_retval = xmlCatalogResolveSystem(sysID);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogResolveURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * URI;

    if (!PyArg_ParseTuple(args, "z:xmlCatalogResolveURI", &URI))
        return(NULL);

    c_retval = xmlCatalogResolveURI(URI);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlCatalogSetDebug(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int level;

    if (!PyArg_ParseTuple(args, "i:xmlCatalogSetDebug", &level))
        return(NULL);

    c_retval = xmlCatalogSetDebug(level);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
PyObject *
libxml_xmlCharStrdup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    char * cur;

    if (!PyArg_ParseTuple(args, "z:xmlCharStrdup", &cur))
        return(NULL);

    c_retval = xmlCharStrdup(cur);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCharStrndup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    char * cur;
    int len;

    if (!PyArg_ParseTuple(args, "zi:xmlCharStrndup", &cur, &len))
        return(NULL);

    c_retval = xmlCharStrndup(cur, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCheckFilename(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * path;

    if (libxml_deprecationWarning("xmlCheckFilename") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlCheckFilename", &path))
        return(NULL);

    c_retval = xmlCheckFilename(path);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCheckLanguageID(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * lang;

    if (libxml_deprecationWarning("xmlCheckLanguageID") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlCheckLanguageID", &lang))
        return(NULL);

    c_retval = xmlCheckLanguageID(lang);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlCheckUTF8(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned char * utf;

    if (!PyArg_ParseTuple(args, "z:xmlCheckUTF8", &utf))
        return(NULL);

    c_retval = xmlCheckUTF8(utf);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCleanupCharEncodingHandlers(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlCleanupCharEncodingHandlers") == -1)
        return(NULL);

    xmlCleanupCharEncodingHandlers();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCleanupEncodingAliases(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlCleanupEncodingAliases") == -1)
        return(NULL);

    xmlCleanupEncodingAliases();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCleanupGlobals(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlCleanupGlobals") == -1)
        return(NULL);

    xmlCleanupGlobals();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlCleanupInputCallbacks(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlCleanupInputCallbacks();
    Py_INCREF(Py_None);
    return(Py_None);
}

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlCleanupOutputCallbacks(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlCleanupOutputCallbacks();
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlClearParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlClearParserCtxt") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlClearParserCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlClearParserCtxt(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#if defined(LIBXML_SGML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlConvertSGMLCatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlCatalog * catal;
    PyObject *pyobj_catal;

    if (libxml_deprecationWarning("xmlConvertSGMLCatalog") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlConvertSGMLCatalog", &pyobj_catal))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    c_retval = xmlConvertSGMLCatalog(catal);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SGML_CATALOG_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCopyChar(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int len;
    xmlChar * out;
    int val;

    if (libxml_deprecationWarning("xmlCopyChar") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "izi:xmlCopyChar", &len, &out, &val))
        return(NULL);

    c_retval = xmlCopyChar(len, out, val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCopyCharMultiByte(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * out;
    int val;

    if (libxml_deprecationWarning("xmlCopyCharMultiByte") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "zi:xmlCopyCharMultiByte", &out, &val))
        return(NULL);

    c_retval = xmlCopyCharMultiByte(out, val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlCopyDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    int recursive;

    if (!PyArg_ParseTuple(args, "Oi:xmlCopyDoc", &pyobj_doc, &recursive))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlCopyDoc(doc, recursive);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyDtd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDtd * c_retval;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;

    if (!PyArg_ParseTuple(args, "O:xmlCopyDtd", &pyobj_dtd))
        return(NULL);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlCopyDtd(dtd);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyError(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlError * from;
    PyObject *pyobj_from;
    xmlError * to;
    PyObject *pyobj_to;

    if (!PyArg_ParseTuple(args, "OO:xmlCopyError", &pyobj_from, &pyobj_to))
        return(NULL);
    from = (xmlError *) PyError_Get(pyobj_from);
    to = (xmlError *) PyError_Get(pyobj_to);

    c_retval = xmlCopyError(from, to);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyNamespace(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNs * c_retval;
    xmlNs * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlCopyNamespace", &pyobj_cur))
        return(NULL);
    cur = (xmlNs *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlCopyNamespace(cur);
    py_retval = libxml_xmlNsPtrWrap((xmlNs *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyNamespaceList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNs * c_retval;
    xmlNs * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlCopyNamespaceList", &pyobj_cur))
        return(NULL);
    cur = (xmlNs *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlCopyNamespaceList(cur);
    py_retval = libxml_xmlNsPtrWrap((xmlNs *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    int recursive;

    if (!PyArg_ParseTuple(args, "Oi:xmlCopyNode", &pyobj_node, &recursive))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlCopyNode(node, recursive);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyNodeList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlCopyNodeList", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlCopyNodeList(node);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * target;
    PyObject *pyobj_target;
    xmlAttr * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlCopyProp", &pyobj_target, &pyobj_cur))
        return(NULL);
    target = (xmlNode *) PyxmlNode_Get(pyobj_target);
    cur = (xmlAttr *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlCopyProp(target, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCopyPropList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * target;
    PyObject *pyobj_target;
    xmlAttr * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlCopyPropList", &pyobj_target, &pyobj_cur))
        return(NULL);
    target = (xmlNode *) PyxmlNode_Get(pyobj_target);
    cur = (xmlAttr *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlCopyPropList(target, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCreateDocParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;
    xmlChar * cur;

    if (!PyArg_ParseTuple(args, "z:xmlCreateDocParserCtxt", &cur))
        return(NULL);

    c_retval = xmlCreateDocParserCtxt(cur);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlCreateEntityParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;
    xmlChar * URL;
    xmlChar * ID;
    xmlChar * base;

    if (libxml_deprecationWarning("xmlCreateEntityParserCtxt") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "zzz:xmlCreateEntityParserCtxt", &URL, &ID, &base))
        return(NULL);

    c_retval = xmlCreateEntityParserCtxt(URL, ID, base);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlCreateFileParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;
    char * filename;

    if (!PyArg_ParseTuple(args, "z:xmlCreateFileParserCtxt", &filename))
        return(NULL);

    c_retval = xmlCreateFileParserCtxt(filename);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCreateIntSubset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDtd * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    xmlChar * publicId;
    xmlChar * systemId;

    if (!PyArg_ParseTuple(args, "Ozzz:xmlCreateIntSubset", &pyobj_doc, &name, &publicId, &systemId))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlCreateIntSubset(doc, name, publicId, systemId);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCreateMemoryParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;

    if (!PyArg_ParseTuple(args, "s#i:xmlCreateMemoryParserCtxt", &buffer, &py_buffsize0, &size))
        return(NULL);

    c_retval = xmlCreateMemoryParserCtxt(buffer, size);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCreateURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    xmlURI * c_retval;

    c_retval = xmlCreateURI();
    py_retval = libxml_xmlURIPtrWrap((xmlURI *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCreateURLParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;
    char * filename;
    int options;

    if (!PyArg_ParseTuple(args, "zi:xmlCreateURLParserCtxt", &filename, &options))
        return(NULL);

    c_retval = xmlCreateURLParserCtxt(filename, options);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtErrMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtErrMemory", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlCtxtErrMemory(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlCtxtGetDeclaredEncoding(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetDeclaredEncoding", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetDeclaredEncoding(ctxt);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtGetDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetDocument", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetDocument(ctxt);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtGetNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetNode", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetNode(ctxt);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtGetOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetOptions", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetOptions(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtGetStandalone(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetStandalone", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetStandalone(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlCtxtGetValidCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlValidCtxt * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetValidCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetValidCtxt(ctxt);
    py_retval = libxml_xmlValidCtxtPtrWrap((xmlValidCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
PyObject *
libxml_xmlCtxtGetVersion(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtGetVersion", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtGetVersion(ctxt);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtIsHtml(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtIsHtml", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtIsHtml(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtIsInSubset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtIsInSubset", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtIsInSubset(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtIsStopped(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtIsStopped", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtIsStopped(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtReadDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * cur;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozzzi:xmlCtxtReadDoc", &pyobj_ctxt, &cur, &URL, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtReadDoc(ctxt, cur, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtReadFd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int fd;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Oizzi:xmlCtxtReadFd", &pyobj_ctxt, &fd, &URL, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtReadFd(ctxt, fd, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtReadFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * filename;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozzi:xmlCtxtReadFile", &pyobj_ctxt, &filename, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtReadFile(ctxt, filename, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtReadMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Os#izzi:xmlCtxtReadMemory", &pyobj_ctxt, &buffer, &py_buffsize0, &size, &URL, &encoding, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtReadMemory(ctxt, buffer, size, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtReset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlCtxtReset", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlCtxtReset(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlCtxtResetPush(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * chunk;
    Py_ssize_t  py_buffsize0;
    int size;
    char * filename;
    char * encoding;

    if (!PyArg_ParseTuple(args, "Os#izz:xmlCtxtResetPush", &pyobj_ctxt, &chunk, &py_buffsize0, &size, &filename, &encoding))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtResetPush(ctxt, chunk, size, filename, encoding);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtSetOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "Oi:xmlCtxtSetOptions", &pyobj_ctxt, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtSetOptions(ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlCtxtUseOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "Oi:xmlCtxtUseOptions", &pyobj_ctxt, &options))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlCtxtUseOptions(ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlCtxtValidateDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlCtxtValidateDocument", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlCtxtValidateDocument(ctxt, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlCtxtValidateDtd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;

    if (!PyArg_ParseTuple(args, "OOO:xmlCtxtValidateDtd", &pyobj_ctxt, &pyobj_doc, &pyobj_dtd))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlCtxtValidateDtd(ctxt, doc, dtd);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugCheckDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    FILE * output;
    PyObject *pyobj_output;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlDebugCheckDocument", &pyobj_output, &pyobj_doc))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlDebugCheckDocument(output, doc);
    PyFile_Release(output);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpAttr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlAttr * attr;
    PyObject *pyobj_attr;
    int depth;

    if (!PyArg_ParseTuple(args, "OOi:xmlDebugDumpAttr", &pyobj_output, &pyobj_attr, &depth))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    xmlDebugDumpAttr(output, attr, depth);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpAttrList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlAttr * attr;
    PyObject *pyobj_attr;
    int depth;

    if (!PyArg_ParseTuple(args, "OOi:xmlDebugDumpAttrList", &pyobj_output, &pyobj_attr, &depth))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    xmlDebugDumpAttrList(output, attr, depth);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpDTD(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;

    if (!PyArg_ParseTuple(args, "OO:xmlDebugDumpDTD", &pyobj_output, &pyobj_dtd))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    xmlDebugDumpDTD(output, dtd);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlDebugDumpDocument", &pyobj_output, &pyobj_doc))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    xmlDebugDumpDocument(output, doc);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpDocumentHead(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlDebugDumpDocumentHead", &pyobj_output, &pyobj_doc))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    xmlDebugDumpDocumentHead(output, doc);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpEntities(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlDebugDumpEntities", &pyobj_output, &pyobj_doc))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    xmlDebugDumpEntities(output, doc);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlNode * node;
    PyObject *pyobj_node;
    int depth;

    if (!PyArg_ParseTuple(args, "OOi:xmlDebugDumpNode", &pyobj_output, &pyobj_node, &depth))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    xmlDebugDumpNode(output, node, depth);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpNodeList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlNode * node;
    PyObject *pyobj_node;
    int depth;

    if (!PyArg_ParseTuple(args, "OOi:xmlDebugDumpNodeList", &pyobj_output, &pyobj_node, &depth))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    xmlDebugDumpNodeList(output, node, depth);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpOneNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlNode * node;
    PyObject *pyobj_node;
    int depth;

    if (!PyArg_ParseTuple(args, "OOi:xmlDebugDumpOneNode", &pyobj_output, &pyobj_node, &depth))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    xmlDebugDumpOneNode(output, node, depth);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlDebugDumpString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlChar * str;

    if (!PyArg_ParseTuple(args, "Oz:xmlDebugDumpString", &pyobj_output, &str))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);

    xmlDebugDumpString(output, str);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_DEBUG_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlDefaultSAXHandlerInit(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlDefaultSAXHandlerInit") == -1)
        return(NULL);

    xmlDefaultSAXHandlerInit();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlDelEncodingAlias(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * alias;

    if (libxml_deprecationWarning("xmlDelEncodingAlias") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlDelEncodingAlias", &alias))
        return(NULL);

    c_retval = xmlDelEncodingAlias(alias);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlDictCleanup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlDictCleanup") == -1)
        return(NULL);

    xmlDictCleanup();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlDocCopyNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    int recursive;

    if (!PyArg_ParseTuple(args, "OOi:xmlDocCopyNode", &pyobj_node, &pyobj_doc, &recursive))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlDocCopyNode(node, doc, recursive);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlDocCopyNodeList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "OO:xmlDocCopyNodeList", &pyobj_doc, &pyobj_node))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlDocCopyNodeList(doc, node);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlDocDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    FILE * f;
    PyObject *pyobj_f;
    xmlDoc * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlDocDump", &pyobj_f, &pyobj_cur))
        return(NULL);
    f = (FILE *) PyFile_Get(pyobj_f);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlDocDump(f, cur);
    PyFile_Release(f);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlDocFormatDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    FILE * f;
    PyObject *pyobj_f;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    int format;

    if (!PyArg_ParseTuple(args, "OOi:xmlDocFormatDump", &pyobj_f, &pyobj_cur, &format))
        return(NULL);
    f = (FILE *) PyFile_Get(pyobj_f);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlDocFormatDump(f, cur, format);
    PyFile_Release(f);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
PyObject *
libxml_xmlDocGetRootElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlDocGetRootElement", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlDocGetRootElement(doc);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlDocSetRootElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * root;
    PyObject *pyobj_root;

    if (!PyArg_ParseTuple(args, "OO:xmlDocSetRootElement", &pyobj_doc, &pyobj_root))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    root = (xmlNode *) PyxmlNode_Get(pyobj_root);

    c_retval = xmlDocSetRootElement(doc, root);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlElemDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * f;
    PyObject *pyobj_f;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OOO:xmlElemDump", &pyobj_f, &pyobj_doc, &pyobj_cur))
        return(NULL);
    f = (FILE *) PyFile_Get(pyobj_f);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    xmlElemDump(f, doc, cur);
    PyFile_Release(f);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
PyObject *
libxml_xmlEncodeEntitiesReentrant(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * input;

    if (!PyArg_ParseTuple(args, "Oz:xmlEncodeEntitiesReentrant", &pyobj_doc, &input))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlEncodeEntitiesReentrant(doc, input);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlEncodeSpecialChars(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * input;

    if (!PyArg_ParseTuple(args, "Oz:xmlEncodeSpecialChars", &pyobj_doc, &input))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlEncodeSpecialChars(doc, input);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlErrorGetCode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlError * Error;
    PyObject *pyobj_Error;

    if (!PyArg_ParseTuple(args, "O:xmlErrorGetCode", &pyobj_Error))
        return(NULL);
    Error = (xmlError *) PyError_Get(pyobj_Error);

    c_retval = Error->code;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlErrorGetDomain(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlError * Error;
    PyObject *pyobj_Error;

    if (!PyArg_ParseTuple(args, "O:xmlErrorGetDomain", &pyobj_Error))
        return(NULL);
    Error = (xmlError *) PyError_Get(pyobj_Error);

    c_retval = Error->domain;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlErrorGetFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlError * Error;
    PyObject *pyobj_Error;

    if (!PyArg_ParseTuple(args, "O:xmlErrorGetFile", &pyobj_Error))
        return(NULL);
    Error = (xmlError *) PyError_Get(pyobj_Error);

    c_retval = Error->file;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlErrorGetLevel(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlError * Error;
    PyObject *pyobj_Error;

    if (!PyArg_ParseTuple(args, "O:xmlErrorGetLevel", &pyobj_Error))
        return(NULL);
    Error = (xmlError *) PyError_Get(pyobj_Error);

    c_retval = Error->level;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlErrorGetLine(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlError * Error;
    PyObject *pyobj_Error;

    if (!PyArg_ParseTuple(args, "O:xmlErrorGetLine", &pyobj_Error))
        return(NULL);
    Error = (xmlError *) PyError_Get(pyobj_Error);

    c_retval = Error->line;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlErrorGetMessage(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlError * Error;
    PyObject *pyobj_Error;

    if (!PyArg_ParseTuple(args, "O:xmlErrorGetMessage", &pyobj_Error))
        return(NULL);
    Error = (xmlError *) PyError_Get(pyobj_Error);

    c_retval = Error->message;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlFileMatch(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;

    if (libxml_deprecationWarning("xmlFileMatch") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlFileMatch", &filename))
        return(NULL);

    c_retval = xmlFileMatch(filename);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlFirstElementChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;

    if (!PyArg_ParseTuple(args, "O:xmlFirstElementChild", &pyobj_parent))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);

    c_retval = xmlFirstElementChild(parent);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlFreeCatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlCatalog * catal;
    PyObject *pyobj_catal;

    if (libxml_deprecationWarning("xmlFreeCatalog") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlFreeCatalog", &pyobj_catal))
        return(NULL);
    catal = (xmlCatalog *) Pycatalog_Get(pyobj_catal);

    xmlFreeCatalog(catal);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
PyObject *
libxml_xmlFreeDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlDoc * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeDoc", &pyobj_cur))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    xmlFreeDoc(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeDtd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlDtd * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeDtd", &pyobj_cur))
        return(NULL);
    cur = (xmlDtd *) PyxmlNode_Get(pyobj_cur);

    xmlFreeDtd(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlEntity * entity;
    PyObject *pyobj_entity;

    if (!PyArg_ParseTuple(args, "O:xmlFreeEntity", &pyobj_entity))
        return(NULL);
    entity = (xmlEntity *) PyxmlNode_Get(pyobj_entity);

    xmlFreeEntity(entity);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeNode", &pyobj_cur))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    xmlFreeNode(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeNodeList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeNodeList", &pyobj_cur))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    xmlFreeNodeList(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNs * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeNs", &pyobj_cur))
        return(NULL);
    cur = (xmlNs *) PyxmlNode_Get(pyobj_cur);

    xmlFreeNs(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeNsList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNs * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeNsList", &pyobj_cur))
        return(NULL);
    cur = (xmlNs *) PyxmlNode_Get(pyobj_cur);

    xmlFreeNsList(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeParserInputBuffer(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserInputBuffer * in;
    PyObject *pyobj_in;

    if (!PyArg_ParseTuple(args, "O:xmlFreeParserInputBuffer", &pyobj_in))
        return(NULL);
    in = (xmlParserInputBuffer *) PyinputBuffer_Get(pyobj_in);

    xmlFreeParserInputBuffer(in);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlAttr * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreeProp", &pyobj_cur))
        return(NULL);
    cur = (xmlAttr *) PyxmlNode_Get(pyobj_cur);

    xmlFreeProp(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreePropList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlAttr * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlFreePropList", &pyobj_cur))
        return(NULL);
    cur = (xmlAttr *) PyxmlNode_Get(pyobj_cur);

    xmlFreePropList(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlFreeURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * uri;
    PyObject *pyobj_uri;

    if (!PyArg_ParseTuple(args, "O:xmlFreeURI", &pyobj_uri))
        return(NULL);
    uri = (xmlURI *) PyURI_Get(pyobj_uri);

    xmlFreeURI(uri);
    Py_INCREF(Py_None);
    return(Py_None);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlGetCompressMode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    int c_retval;

    if (libxml_deprecationWarning("xmlGetCompressMode") == -1)
        return(NULL);

    c_retval = xmlGetCompressMode();
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlGetDocCompressMode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlGetDocCompressMode", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlGetDocCompressMode(doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetDocEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetDocEntity", &pyobj_doc, &name))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlGetDocEntity(doc, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetDtdAttrDesc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttribute * c_retval;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;
    xmlChar * elem;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Ozz:xmlGetDtdAttrDesc", &pyobj_dtd, &elem, &name))
        return(NULL);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlGetDtdAttrDesc(dtd, elem, name);
    py_retval = libxml_xmlAttributePtrWrap((xmlAttribute *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetDtdElementDesc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlElement * c_retval;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetDtdElementDesc", &pyobj_dtd, &name))
        return(NULL);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlGetDtdElementDesc(dtd, name);
    py_retval = libxml_xmlElementPtrWrap((xmlElement *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetDtdEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetDtdEntity", &pyobj_doc, &name))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlGetDtdEntity(doc, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetDtdQAttrDesc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttribute * c_retval;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;
    xmlChar * elem;
    xmlChar * name;
    xmlChar * prefix;

    if (!PyArg_ParseTuple(args, "Ozzz:xmlGetDtdQAttrDesc", &pyobj_dtd, &elem, &name, &prefix))
        return(NULL);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlGetDtdQAttrDesc(dtd, elem, name, prefix);
    py_retval = libxml_xmlAttributePtrWrap((xmlAttribute *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetDtdQElementDesc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlElement * c_retval;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;
    xmlChar * name;
    xmlChar * prefix;

    if (!PyArg_ParseTuple(args, "Ozz:xmlGetDtdQElementDesc", &pyobj_dtd, &name, &prefix))
        return(NULL);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlGetDtdQElementDesc(dtd, name, prefix);
    py_retval = libxml_xmlElementPtrWrap((xmlElement *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlGetEncodingAlias(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    char * alias;

    if (libxml_deprecationWarning("xmlGetEncodingAlias") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlGetEncodingAlias", &alias))
        return(NULL);

    c_retval = xmlGetEncodingAlias(alias);
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlGetID(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * ID;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetID", &pyobj_doc, &ID))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlGetID(doc, ID);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetIntSubset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDtd * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlGetIntSubset", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlGetIntSubset(doc);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetLastChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;

    if (!PyArg_ParseTuple(args, "O:xmlGetLastChild", &pyobj_parent))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);

    c_retval = xmlGetLastChild(parent);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetLastError(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    const xmlError * c_retval;

    c_retval = xmlGetLastError();
    py_retval = libxml_xmlErrorPtrWrap((const xmlError *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetLineNo(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    long c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlGetLineNo", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlGetLineNo(node);
    py_retval = libxml_longWrap((long) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetNoNsProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetNoNsProp", &pyobj_node, &name))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlGetNoNsProp(node, name);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetNodePath(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlGetNodePath", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlGetNodePath(node);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetNsProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;
    xmlChar * nameSpace;

    if (!PyArg_ParseTuple(args, "Ozz:xmlGetNsProp", &pyobj_node, &name, &nameSpace))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlGetNsProp(node, name, nameSpace);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetParameterEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetParameterEntity", &pyobj_doc, &name))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlGetParameterEntity(doc, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetPredefinedEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "z:xmlGetPredefinedEntity", &name))
        return(NULL);

    c_retval = xmlGetPredefinedEntity(name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlGetProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlGetProp", &pyobj_node, &name))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlGetProp(node, name);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlHasNsProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;
    xmlChar * nameSpace;

    if (!PyArg_ParseTuple(args, "Ozz:xmlHasNsProp", &pyobj_node, &name, &nameSpace))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlHasNsProp(node, name, nameSpace);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlHasProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlHasProp", &pyobj_node, &name))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlHasProp(node, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlInitCharEncodingHandlers(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlInitCharEncodingHandlers") == -1)
        return(NULL);

    xmlInitCharEncodingHandlers();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlInitGlobals(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlInitGlobals") == -1)
        return(NULL);

    xmlInitGlobals();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlInitParser(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlInitParser();
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlInitParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlInitParserCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlInitParserCtxt(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlInitializeCatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlInitializeCatalog();
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlInitializeDict(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    int c_retval;

    if (libxml_deprecationWarning("xmlInitializeDict") == -1)
        return(NULL);

    c_retval = xmlInitializeDict();
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsBaseChar(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsBaseChar") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsBaseChar", &ch))
        return(NULL);

    c_retval = xmlIsBaseChar(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsBlank(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsBlank") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsBlank", &ch))
        return(NULL);

    c_retval = xmlIsBlank(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlIsBlankNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlIsBlankNode", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlIsBlankNode(node);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsChar(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsChar") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsChar", &ch))
        return(NULL);

    c_retval = xmlIsChar(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsCombining(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsCombining") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsCombining", &ch))
        return(NULL);

    c_retval = xmlIsCombining(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsDigit(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsDigit") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsDigit", &ch))
        return(NULL);

    c_retval = xmlIsDigit(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsExtender(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsExtender") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsExtender", &ch))
        return(NULL);

    c_retval = xmlIsExtender(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlIsID(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlAttr * attr;
    PyObject *pyobj_attr;

    if (!PyArg_ParseTuple(args, "OOO:xmlIsID", &pyobj_doc, &pyobj_elem, &pyobj_attr))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    c_retval = xmlIsID(doc, elem, attr);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsIdeographic(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsIdeographic") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsIdeographic", &ch))
        return(NULL);

    c_retval = xmlIsIdeographic(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsLetter(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int c;

    if (libxml_deprecationWarning("xmlIsLetter") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsLetter", &c))
        return(NULL);

    c_retval = xmlIsLetter(c);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsMixedElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;

    if (libxml_deprecationWarning("xmlIsMixedElement") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oz:xmlIsMixedElement", &pyobj_doc, &name))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlIsMixedElement(doc, name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsPubidChar(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    unsigned int ch;

    if (libxml_deprecationWarning("xmlIsPubidChar") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlIsPubidChar", &ch))
        return(NULL);

    c_retval = xmlIsPubidChar(ch);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlIsRef(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlAttr * attr;
    PyObject *pyobj_attr;

    if (libxml_deprecationWarning("xmlIsRef") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOO:xmlIsRef", &pyobj_doc, &pyobj_elem, &pyobj_attr))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    c_retval = xmlIsRef(doc, elem, attr);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlIsXHTML(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * systemID;
    xmlChar * publicID;

    if (!PyArg_ParseTuple(args, "zz:xmlIsXHTML", &systemID, &publicID))
        return(NULL);

    c_retval = xmlIsXHTML(systemID, publicID);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlKeepBlanksDefault(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int val;

    if (libxml_deprecationWarning("xmlKeepBlanksDefault") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlKeepBlanksDefault", &val))
        return(NULL);

    c_retval = xmlKeepBlanksDefault(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlLastElementChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;

    if (!PyArg_ParseTuple(args, "O:xmlLastElementChild", &pyobj_parent))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);

    c_retval = xmlLastElementChild(parent);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlLineNumbersDefault(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int val;

    if (libxml_deprecationWarning("xmlLineNumbersDefault") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlLineNumbersDefault", &val))
        return(NULL);

    c_retval = xmlLineNumbersDefault(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlLoadACatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlCatalog * c_retval;
    char * filename;

    if (libxml_deprecationWarning("xmlLoadACatalog") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlLoadACatalog", &filename))
        return(NULL);

    c_retval = xmlLoadACatalog(filename);
    py_retval = libxml_xmlCatalogPtrWrap((xmlCatalog *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlLoadCatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;

    if (!PyArg_ParseTuple(args, "z:xmlLoadCatalog", &filename))
        return(NULL);

    c_retval = xmlLoadCatalog(filename);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_CATALOG_ENABLED)
PyObject *
libxml_xmlLoadCatalogs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    char * paths;

    if (!PyArg_ParseTuple(args, "z:xmlLoadCatalogs", &paths))
        return(NULL);

    xmlLoadCatalogs(paths);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_CATALOG_ENABLED) */
#if defined(LIBXML_SGML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlLoadSGMLSuperCatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlCatalog * c_retval;
    char * filename;

    if (libxml_deprecationWarning("xmlLoadSGMLSuperCatalog") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlLoadSGMLSuperCatalog", &filename))
        return(NULL);

    c_retval = xmlLoadSGMLSuperCatalog(filename);
    py_retval = libxml_xmlCatalogPtrWrap((xmlCatalog *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SGML_CATALOG_ENABLED) */
PyObject *
libxml_xmlNewCDataBlock(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * content;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlNewCDataBlock", &pyobj_doc, &content, &len))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewCDataBlock(doc, content, len);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlNewCatalog(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlCatalog * c_retval;
    int sgml;

    if (libxml_deprecationWarning("xmlNewCatalog") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlNewCatalog", &sgml))
        return(NULL);

    c_retval = xmlNewCatalog(sgml);
    py_retval = libxml_xmlCatalogPtrWrap((xmlCatalog *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
PyObject *
libxml_xmlNewCharRef(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlNewCharRef", &pyobj_doc, &name))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewCharRef(doc, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewChild", &pyobj_parent, &pyobj_ns, &name, &content))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewChild(parent, ns, name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewComment(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "z:xmlNewComment", &content))
        return(NULL);

    c_retval = xmlNewComment(content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * version;

    if (!PyArg_ParseTuple(args, "z:xmlNewDoc", &version))
        return(NULL);

    c_retval = xmlNewDoc(version);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocComment(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Oz:xmlNewDocComment", &pyobj_doc, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDocComment(doc, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocFragment(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlNewDocFragment", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDocFragment(doc);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewDocNode", &pyobj_doc, &pyobj_ns, &name, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewDocNode(doc, ns, name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocNodeEatName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewDocNodeEatName", &pyobj_doc, &pyobj_ns, &name, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewDocNodeEatName(doc, ns, name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocPI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Ozz:xmlNewDocPI", &pyobj_doc, &name, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDocPI(doc, name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "Ozz:xmlNewDocProp", &pyobj_doc, &name, &value))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDocProp(doc, name, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocRawNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewDocRawNode", &pyobj_doc, &pyobj_ns, &name, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewDocRawNode(doc, ns, name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocText(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Oz:xmlNewDocText", &pyobj_doc, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDocText(doc, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDocTextLen(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * content;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlNewDocTextLen", &pyobj_doc, &content, &len))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDocTextLen(doc, content, len);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewDtd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDtd * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    xmlChar * publicId;
    xmlChar * systemId;

    if (!PyArg_ParseTuple(args, "Ozzz:xmlNewDtd", &pyobj_doc, &name, &publicId, &systemId))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewDtd(doc, name, publicId, systemId);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;
    int type;
    xmlChar * publicId;
    xmlChar * systemId;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Ozizzz:xmlNewEntity", &pyobj_doc, &name, &type, &publicId, &systemId, &content))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewEntity(doc, name, type, publicId, systemId, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewNodeEatName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlNewNodeEatName", &pyobj_ns, &name))
        return(NULL);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewNodeEatName(ns, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNs * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * href;
    xmlChar * prefix;

    if (!PyArg_ParseTuple(args, "Ozz:xmlNewNs", &pyobj_node, &href, &prefix))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlNewNs(node, href, prefix);
    py_retval = libxml_xmlNsPtrWrap((xmlNs *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewNsProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewNsProp", &pyobj_node, &pyobj_ns, &name, &value))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewNsProp(node, ns, name, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewNsPropEatName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewNsPropEatName", &pyobj_node, &pyobj_ns, &name, &value))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewNsPropEatName(node, ns, name, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewPI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "zz:xmlNewPI", &name, &content))
        return(NULL);

    c_retval = xmlNewPI(name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;

    c_retval = xmlNewParserCtxt();
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "Ozz:xmlNewProp", &pyobj_node, &name, &value))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlNewProp(node, name, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewReference(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlNewReference", &pyobj_doc, &name))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlNewReference(doc, name);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewText(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "z:xmlNewText", &content))
        return(NULL);

    c_retval = xmlNewText(content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewTextChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * parent;
    PyObject *pyobj_parent;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "OOzz:xmlNewTextChild", &pyobj_parent, &pyobj_ns, &name, &content))
        return(NULL);
    parent = (xmlNode *) PyxmlNode_Get(pyobj_parent);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlNewTextChild(parent, ns, name, content);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNewTextLen(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlChar * content;
    int len;

    if (!PyArg_ParseTuple(args, "zi:xmlNewTextLen", &content, &len))
        return(NULL);

    c_retval = xmlNewTextLen(content, len);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlNewTextReader(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    xmlParserInputBuffer * input;
    PyObject *pyobj_input;
    char * URI;

    if (!PyArg_ParseTuple(args, "Oz:xmlNewTextReader", &pyobj_input, &URI))
        return(NULL);
    input = (xmlParserInputBuffer *) PyinputBuffer_Get(pyobj_input);

    c_retval = xmlNewTextReader(input, URI);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlNewTextReaderFilename(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    char * URI;

    if (!PyArg_ParseTuple(args, "z:xmlNewTextReaderFilename", &URI))
        return(NULL);

    c_retval = xmlNewTextReaderFilename(URI);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlNewValidCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    xmlValidCtxt * c_retval;

    c_retval = xmlNewValidCtxt();
    py_retval = libxml_xmlValidCtxtPtrWrap((xmlValidCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlNextChar(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlNextChar") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlNextChar", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlNextChar(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlNextElementSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlNextElementSibling", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlNextElementSibling(node);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeAddContent(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Oz:xmlNodeAddContent", &pyobj_cur, &content))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeAddContent(cur, content);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeAddContentLen(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * content;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlNodeAddContentLen", &pyobj_cur, &content, &len))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeAddContentLen(cur, content, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlNodeDumpOutput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlOutputBuffer * buf;
    PyObject *pyobj_buf;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;
    int level;
    int format;
    char * encoding;

    if (!PyArg_ParseTuple(args, "OOOiiz:xmlNodeDumpOutput", &pyobj_buf, &pyobj_doc, &pyobj_cur, &level, &format, &encoding))
        return(NULL);
    buf = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_buf);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    xmlNodeDumpOutput(buf, doc, cur, level, format, encoding);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
PyObject *
libxml_xmlNodeGetBase(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlNodeGetBase", &pyobj_doc, &pyobj_cur))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeGetBase(doc, cur);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeGetContent(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlNodeGetContent", &pyobj_cur))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeGetContent(cur);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeGetLang(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlNodeGetLang", &pyobj_cur))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeGetLang(cur);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeGetSpacePreserve(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlNodeGetSpacePreserve", &pyobj_cur))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeGetSpacePreserve(cur);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeIsText(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlNodeIsText", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlNodeIsText(node);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeListGetRawString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * list;
    PyObject *pyobj_list;
    int inLine;

    if (!PyArg_ParseTuple(args, "OOi:xmlNodeListGetRawString", &pyobj_doc, &pyobj_list, &inLine))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    list = (xmlNode *) PyxmlNode_Get(pyobj_list);

    c_retval = xmlNodeListGetRawString(doc, list, inLine);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeListGetString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * list;
    PyObject *pyobj_list;
    int inLine;

    if (!PyArg_ParseTuple(args, "OOi:xmlNodeListGetString", &pyobj_doc, &pyobj_list, &inLine))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    list = (xmlNode *) PyxmlNode_Get(pyobj_list);

    c_retval = xmlNodeListGetString(doc, list, inLine);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeSetBase(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * uri;

    if (!PyArg_ParseTuple(args, "Oz:xmlNodeSetBase", &pyobj_cur, &uri))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeSetBase(cur, uri);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeSetContent(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * content;

    if (!PyArg_ParseTuple(args, "Oz:xmlNodeSetContent", &pyobj_cur, &content))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeSetContent(cur, content);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeSetContentLen(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * content;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlNodeSetContentLen", &pyobj_cur, &content, &len))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeSetContentLen(cur, content, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeSetLang(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * lang;

    if (!PyArg_ParseTuple(args, "Oz:xmlNodeSetLang", &pyobj_cur, &lang))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeSetLang(cur, lang);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNodeSetName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNode * cur;
    PyObject *pyobj_cur;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlNodeSetName", &pyobj_cur, &name))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    xmlNodeSetName(cur, name);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlNodeSetSpacePreserve(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * cur;
    PyObject *pyobj_cur;
    int val;

    if (!PyArg_ParseTuple(args, "Oi:xmlNodeSetSpacePreserve", &pyobj_cur, &val))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlNodeSetSpacePreserve(cur, val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlNormalizeURIPath(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * path;

    if (!PyArg_ParseTuple(args, "z:xmlNormalizeURIPath", &path))
        return(NULL);

    c_retval = xmlNormalizeURIPath(path);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlNormalizeWindowsPath(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * path;

    if (libxml_deprecationWarning("xmlNormalizeWindowsPath") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlNormalizeWindowsPath", &path))
        return(NULL);

    c_retval = xmlNormalizeWindowsPath(path);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlOutputBufferGetContent(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlOutputBuffer * out;
    PyObject *pyobj_out;

    if (!PyArg_ParseTuple(args, "O:xmlOutputBufferGetContent", &pyobj_out))
        return(NULL);
    out = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_out);

    c_retval = xmlOutputBufferGetContent(out);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlOutputBufferWrite(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlOutputBuffer * out;
    PyObject *pyobj_out;
    int len;
    char * buf;

    if (!PyArg_ParseTuple(args, "Oiz:xmlOutputBufferWrite", &pyobj_out, &len, &buf))
        return(NULL);
    out = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_out);

    c_retval = xmlOutputBufferWrite(out, len, buf);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlOutputBufferWriteString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlOutputBuffer * out;
    PyObject *pyobj_out;
    char * str;

    if (!PyArg_ParseTuple(args, "Oz:xmlOutputBufferWriteString", &pyobj_out, &str))
        return(NULL);
    out = (xmlOutputBuffer *) PyoutputBuffer_Get(pyobj_out);

    c_retval = xmlOutputBufferWriteString(out, str);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseAttValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseAttValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseAttValue", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseAttValue(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseAttributeListDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseAttributeListDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseAttributeListDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseAttributeListDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseCDSect(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseCDSect") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseCDSect", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseCDSect(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#if defined(LIBXML_CATALOG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseCatalogFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * filename;

    if (libxml_deprecationWarning("xmlParseCatalogFile") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlParseCatalogFile", &filename))
        return(NULL);

    c_retval = xmlParseCatalogFile(filename);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_CATALOG_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseCharData(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int cdata;

    if (libxml_deprecationWarning("xmlParseCharData") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParseCharData", &pyobj_ctxt, &cdata))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseCharData(ctxt, cdata);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseCharRef(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseCharRef") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseCharRef", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseCharRef(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_PUSH_ENABLED)
PyObject *
libxml_xmlParseChunk(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * chunk;
    Py_ssize_t  py_buffsize0;
    int size;
    int terminate;

    if (!PyArg_ParseTuple(args, "Os#ii:xmlParseChunk", &pyobj_ctxt, &chunk, &py_buffsize0, &size, &terminate))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseChunk(ctxt, chunk, size, terminate);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_PUSH_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseComment(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseComment") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseComment", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseComment(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlParseContent(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlParseContent", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseContent(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlParseDTD(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDtd * c_retval;
    xmlChar * publicId;
    xmlChar * systemId;

    if (!PyArg_ParseTuple(args, "zz:xmlParseDTD", &publicId, &systemId))
        return(NULL);

    c_retval = xmlParseDTD(publicId, systemId);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_SAX1_ENABLED)
PyObject *
libxml_xmlParseDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * cur;

    if (!PyArg_ParseTuple(args, "z:xmlParseDoc", &cur))
        return(NULL);

    c_retval = xmlParseDoc(cur);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SAX1_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseDocTypeDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseDocTypeDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseDocTypeDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseDocTypeDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlParseDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlParseDocument", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseDocument(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseElement") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseElement", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseElement(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseElementDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseElementDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseElementDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseElementDecl(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseEncName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseEncName") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseEncName", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseEncName(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseEncodingDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseEncodingDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseEncodingDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseEncodingDecl(ctxt);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseEndTag(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseEndTag") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseEndTag", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseEndTag(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#if defined(LIBXML_SAX1_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseEntity(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * filename;

    if (libxml_deprecationWarning("xmlParseEntity") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlParseEntity", &filename))
        return(NULL);

    c_retval = xmlParseEntity(filename);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SAX1_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseEntityDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseEntityDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseEntityDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseEntityDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseEntityRef(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlEntity * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseEntityRef") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseEntityRef", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseEntityRef(ctxt);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseExtParsedEnt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseExtParsedEnt") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseExtParsedEnt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseExtParsedEnt(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseExternalSubset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * publicId;
    xmlChar * systemId;

    if (libxml_deprecationWarning("xmlParseExternalSubset") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Ozz:xmlParseExternalSubset", &pyobj_ctxt, &publicId, &systemId))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseExternalSubset(ctxt, publicId, systemId);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#if defined(LIBXML_SAX1_ENABLED)
PyObject *
libxml_xmlParseFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * filename;

    if (!PyArg_ParseTuple(args, "z:xmlParseFile", &filename))
        return(NULL);

    c_retval = xmlParseFile(filename);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SAX1_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseMarkupDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseMarkupDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseMarkupDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseMarkupDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#if defined(LIBXML_SAX1_ENABLED)
PyObject *
libxml_xmlParseMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;

    if (!PyArg_ParseTuple(args, "s#i:xmlParseMemory", &buffer, &py_buffsize0, &size))
        return(NULL);

    c_retval = xmlParseMemory(buffer, size);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SAX1_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseMisc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseMisc") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseMisc", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseMisc(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseName") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseName", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseName(ctxt);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseNmtoken(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseNmtoken") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseNmtoken", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseNmtoken(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseNotationDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseNotationDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseNotationDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseNotationDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParsePEReference(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParsePEReference") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParsePEReference", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParsePEReference(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParsePI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParsePI") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParsePI", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParsePI(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParsePITarget(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParsePITarget") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParsePITarget", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParsePITarget(ctxt);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParsePubidLiteral(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParsePubidLiteral") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParsePubidLiteral", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParsePubidLiteral(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseReference(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseReference") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseReference", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseReference(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseSDDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseSDDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseSDDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseSDDecl(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseStartTag(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseStartTag") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseStartTag", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseStartTag(ctxt);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseSystemLiteral(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseSystemLiteral") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseSystemLiteral", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseSystemLiteral(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseTextDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseTextDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseTextDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseTextDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlParseURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlURI * c_retval;
    char * str;

    if (!PyArg_ParseTuple(args, "z:xmlParseURI", &str))
        return(NULL);

    c_retval = xmlParseURI(str);
    py_retval = libxml_xmlURIPtrWrap((xmlURI *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlParseURIRaw(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlURI * c_retval;
    char * str;
    int raw;

    if (!PyArg_ParseTuple(args, "zi:xmlParseURIRaw", &str, &raw))
        return(NULL);

    c_retval = xmlParseURIRaw(str, raw);
    py_retval = libxml_xmlURIPtrWrap((xmlURI *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlParseURIReference(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlURI * uri;
    PyObject *pyobj_uri;
    char * str;

    if (!PyArg_ParseTuple(args, "Oz:xmlParseURIReference", &pyobj_uri, &str))
        return(NULL);
    uri = (xmlURI *) PyURI_Get(pyobj_uri);

    c_retval = xmlParseURIReference(uri, str);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseVersionInfo(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseVersionInfo") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseVersionInfo", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseVersionInfo(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseVersionNum(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseVersionNum") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseVersionNum", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlParseVersionNum(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParseXMLDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParseXMLDecl") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParseXMLDecl", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParseXMLDecl(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlParserGetDirectory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    char * c_retval;
    char * filename;

    if (!PyArg_ParseTuple(args, "z:xmlParserGetDirectory", &filename))
        return(NULL);

    c_retval = xmlParserGetDirectory(filename);
    py_retval = libxml_charPtrWrap((char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlParserGetDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlParserGetDoc", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = ctxt->myDoc;
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlParserGetIsValid(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlParserGetIsValid", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = ctxt->valid;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlParserGetWellFormed(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlParserGetWellFormed", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = ctxt->wellFormed;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserHandlePEReference(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlParserHandlePEReference") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlParserHandlePEReference", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlParserHandlePEReference(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserInputBufferGrow(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserInputBuffer * in;
    PyObject *pyobj_in;
    int len;

    if (libxml_deprecationWarning("xmlParserInputBufferGrow") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserInputBufferGrow", &pyobj_in, &len))
        return(NULL);
    in = (xmlParserInputBuffer *) PyinputBuffer_Get(pyobj_in);

    c_retval = xmlParserInputBufferGrow(in, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserInputBufferPush(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserInputBuffer * in;
    PyObject *pyobj_in;
    int len;
    char * buf;

    if (libxml_deprecationWarning("xmlParserInputBufferPush") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oiz:xmlParserInputBufferPush", &pyobj_in, &len, &buf))
        return(NULL);
    in = (xmlParserInputBuffer *) PyinputBuffer_Get(pyobj_in);

    c_retval = xmlParserInputBufferPush(in, len, buf);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserInputBufferRead(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserInputBuffer * in;
    PyObject *pyobj_in;
    int len;

    if (libxml_deprecationWarning("xmlParserInputBufferRead") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserInputBufferRead", &pyobj_in, &len))
        return(NULL);
    in = (xmlParserInputBuffer *) PyinputBuffer_Get(pyobj_in);

    c_retval = xmlParserInputBufferRead(in, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserSetLineNumbers(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int linenumbers;

    if (libxml_deprecationWarning("xmlParserSetLineNumbers") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserSetLineNumbers", &pyobj_ctxt, &linenumbers))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    ctxt->linenumbers = linenumbers;
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserSetLoadSubset(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int loadsubset;

    if (libxml_deprecationWarning("xmlParserSetLoadSubset") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserSetLoadSubset", &pyobj_ctxt, &loadsubset))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    ctxt->loadsubset = loadsubset;
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserSetPedantic(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int pedantic;

    if (libxml_deprecationWarning("xmlParserSetPedantic") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserSetPedantic", &pyobj_ctxt, &pedantic))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    ctxt->pedantic = pedantic;
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserSetReplaceEntities(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int replaceEntities;

    if (libxml_deprecationWarning("xmlParserSetReplaceEntities") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserSetReplaceEntities", &pyobj_ctxt, &replaceEntities))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    ctxt->replaceEntities = replaceEntities;
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlParserSetValidate(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int validate;

    if (libxml_deprecationWarning("xmlParserSetValidate") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oi:xmlParserSetValidate", &pyobj_ctxt, &validate))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    ctxt->validate = validate;
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlPathToURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * path;

    if (!PyArg_ParseTuple(args, "z:xmlPathToURI", &path))
        return(NULL);

    c_retval = xmlPathToURI(path);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlPedanticParserDefault(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int val;

    if (libxml_deprecationWarning("xmlPedanticParserDefault") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlPedanticParserDefault", &val))
        return(NULL);

    c_retval = xmlPedanticParserDefault(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlPopInput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlPopInput") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlPopInput", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlPopInput(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlPopOutputCallbacks(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    int c_retval;

    c_retval = xmlPopOutputCallbacks();
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
PyObject *
libxml_xmlPreviousElementSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlPreviousElementSibling", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlPreviousElementSibling(node);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlPrintURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * stream;
    PyObject *pyobj_stream;
    xmlURI * uri;
    PyObject *pyobj_uri;

    if (!PyArg_ParseTuple(args, "OO:xmlPrintURI", &pyobj_stream, &pyobj_uri))
        return(NULL);
    stream = (FILE *) PyFile_Get(pyobj_stream);
    uri = (xmlURI *) PyURI_Get(pyobj_uri);

    xmlPrintURI(stream, uri);
    PyFile_Release(stream);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlReadDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * cur;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zzzi:xmlReadDoc", &cur, &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReadDoc(cur, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlReadFd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    int fd;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "izzi:xmlReadFd", &fd, &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReadFd(fd, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlReadFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zzi:xmlReadFile", &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReadFile(URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlReadMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "s#izzi:xmlReadMemory", &buffer, &py_buffsize0, &size, &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReadMemory(buffer, size, URL, encoding, options);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderForDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    xmlChar * cur;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zzzi:xmlReaderForDoc", &cur, &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReaderForDoc(cur, URL, encoding, options);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderForFd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    int fd;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "izzi:xmlReaderForFd", &fd, &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReaderForFd(fd, URL, encoding, options);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderForFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    char * filename;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zzi:xmlReaderForFile", &filename, &encoding, &options))
        return(NULL);

    c_retval = xmlReaderForFile(filename, encoding, options);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderForMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    char * buffer;
    int size;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "zizzi:xmlReaderForMemory", &buffer, &size, &URL, &encoding, &options))
        return(NULL);

    c_retval = xmlReaderForMemory(buffer, size, URL, encoding, options);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderNewDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * cur;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozzzi:xmlReaderNewDoc", &pyobj_reader, &cur, &URL, &encoding, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlReaderNewDoc(reader, cur, URL, encoding, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderNewFd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    int fd;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Oizzi:xmlReaderNewFd", &pyobj_reader, &fd, &URL, &encoding, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlReaderNewFd(reader, fd, URL, encoding, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderNewFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    char * filename;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozzi:xmlReaderNewFile", &pyobj_reader, &filename, &encoding, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlReaderNewFile(reader, filename, encoding, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderNewMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    char * buffer;
    int size;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "Ozizzi:xmlReaderNewMemory", &pyobj_reader, &buffer, &size, &URL, &encoding, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlReaderNewMemory(reader, buffer, size, URL, encoding, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderNewWalker(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlReaderNewWalker", &pyobj_reader, &pyobj_doc))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlReaderNewWalker(reader, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlReaderWalker(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlTextReader * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlReaderWalker", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlReaderWalker(doc);
    py_retval = libxml_xmlTextReaderPtrWrap((xmlTextReader *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
PyObject *
libxml_xmlReconciliateNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * tree;
    PyObject *pyobj_tree;

    if (!PyArg_ParseTuple(args, "OO:xmlReconciliateNs", &pyobj_doc, &pyobj_tree))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    tree = (xmlNode *) PyxmlNode_Get(pyobj_tree);

    c_retval = xmlReconciliateNs(doc, tree);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_SAX1_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRecoverDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlChar * cur;

    if (libxml_deprecationWarning("xmlRecoverDoc") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlRecoverDoc", &cur))
        return(NULL);

    c_retval = xmlRecoverDoc(cur);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SAX1_ENABLED) */
#if defined(LIBXML_SAX1_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRecoverFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * filename;

    if (libxml_deprecationWarning("xmlRecoverFile") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlRecoverFile", &filename))
        return(NULL);

    c_retval = xmlRecoverFile(filename);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SAX1_ENABLED) */
#if defined(LIBXML_SAX1_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRecoverMemory(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    char * buffer;
    Py_ssize_t  py_buffsize0;
    int size;

    if (libxml_deprecationWarning("xmlRecoverMemory") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "s#i:xmlRecoverMemory", &buffer, &py_buffsize0, &size))
        return(NULL);

    c_retval = xmlRecoverMemory(buffer, size);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SAX1_ENABLED) */
#if defined(LIBXML_REGEXP_ENABLED)
PyObject *
libxml_xmlRegFreeRegexp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlRegexp * regexp;
    PyObject *pyobj_regexp;

    if (!PyArg_ParseTuple(args, "O:xmlRegFreeRegexp", &pyobj_regexp))
        return(NULL);
    regexp = (xmlRegexp *) PyxmlReg_Get(pyobj_regexp);

    xmlRegFreeRegexp(regexp);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_REGEXP_ENABLED) */
#if defined(LIBXML_REGEXP_ENABLED)
PyObject *
libxml_xmlRegexpCompile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlRegexp * c_retval;
    xmlChar * regexp;

    if (!PyArg_ParseTuple(args, "z:xmlRegexpCompile", &regexp))
        return(NULL);

    c_retval = xmlRegexpCompile(regexp);
    py_retval = libxml_xmlRegexpPtrWrap((xmlRegexp *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_REGEXP_ENABLED) */
#if defined(LIBXML_REGEXP_ENABLED)
PyObject *
libxml_xmlRegexpExec(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRegexp * comp;
    PyObject *pyobj_comp;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "Oz:xmlRegexpExec", &pyobj_comp, &value))
        return(NULL);
    comp = (xmlRegexp *) PyxmlReg_Get(pyobj_comp);

    c_retval = xmlRegexpExec(comp, value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_REGEXP_ENABLED) */
#if defined(LIBXML_REGEXP_ENABLED)
PyObject *
libxml_xmlRegexpIsDeterminist(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRegexp * comp;
    PyObject *pyobj_comp;

    if (!PyArg_ParseTuple(args, "O:xmlRegexpIsDeterminist", &pyobj_comp))
        return(NULL);
    comp = (xmlRegexp *) PyxmlReg_Get(pyobj_comp);

    c_retval = xmlRegexpIsDeterminist(comp);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_REGEXP_ENABLED) */
#if defined(LIBXML_REGEXP_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRegexpPrint(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlRegexp * regexp;
    PyObject *pyobj_regexp;

    if (libxml_deprecationWarning("xmlRegexpPrint") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:xmlRegexpPrint", &pyobj_output, &pyobj_regexp))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    regexp = (xmlRegexp *) PyxmlReg_Get(pyobj_regexp);

    xmlRegexpPrint(output, regexp);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_REGEXP_ENABLED) */
PyObject *
libxml_xmlRegisterDefaultInputCallbacks(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlRegisterDefaultInputCallbacks();
    Py_INCREF(Py_None);
    return(Py_None);
}

#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlRegisterDefaultOutputCallbacks(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlRegisterDefaultOutputCallbacks();
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
#endif
#if defined(LIBXML_RELAXNG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRelaxNGCleanupTypes(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlRelaxNGCleanupTypes") == -1)
        return(NULL);

    xmlRelaxNGCleanupTypes();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED) && defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlRelaxNGDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlRelaxNG * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "OO:xmlRelaxNGDump", &pyobj_output, &pyobj_schema))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    schema = (xmlRelaxNG *) PyrelaxNgSchema_Get(pyobj_schema);

    xmlRelaxNGDump(output, schema);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) && defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlRelaxNGDumpTree(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlRelaxNG * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "OO:xmlRelaxNGDumpTree", &pyobj_output, &pyobj_schema))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    schema = (xmlRelaxNG *) PyrelaxNgSchema_Get(pyobj_schema);

    xmlRelaxNGDumpTree(output, schema);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) && defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGFree(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlRelaxNG * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "O:xmlRelaxNGFree", &pyobj_schema))
        return(NULL);
    schema = (xmlRelaxNG *) PyrelaxNgSchema_Get(pyobj_schema);

    xmlRelaxNGFree(schema);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGFreeParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlRelaxNGParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlRelaxNGFreeParserCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlRelaxNGParserCtxt *) PyrelaxNgParserCtxt_Get(pyobj_ctxt);

    xmlRelaxNGFreeParserCtxt(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRelaxNGInitTypes(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    int c_retval;

    if (libxml_deprecationWarning("xmlRelaxNGInitTypes") == -1)
        return(NULL);

    c_retval = xmlRelaxNGInitTypes();
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGNewDocParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlRelaxNGParserCtxt * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlRelaxNGNewDocParserCtxt", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlRelaxNGNewDocParserCtxt(doc);
    py_retval = libxml_xmlRelaxNGParserCtxtPtrWrap((xmlRelaxNGParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGNewMemParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlRelaxNGParserCtxt * c_retval;
    char * buffer;
    int size;

    if (!PyArg_ParseTuple(args, "zi:xmlRelaxNGNewMemParserCtxt", &buffer, &size))
        return(NULL);

    c_retval = xmlRelaxNGNewMemParserCtxt(buffer, size);
    py_retval = libxml_xmlRelaxNGParserCtxtPtrWrap((xmlRelaxNGParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGNewParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlRelaxNGParserCtxt * c_retval;
    char * URL;

    if (!PyArg_ParseTuple(args, "z:xmlRelaxNGNewParserCtxt", &URL))
        return(NULL);

    c_retval = xmlRelaxNGNewParserCtxt(URL);
    py_retval = libxml_xmlRelaxNGParserCtxtPtrWrap((xmlRelaxNGParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGNewValidCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlRelaxNGValidCtxt * c_retval;
    xmlRelaxNG * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "O:xmlRelaxNGNewValidCtxt", &pyobj_schema))
        return(NULL);
    schema = (xmlRelaxNG *) PyrelaxNgSchema_Get(pyobj_schema);

    c_retval = xmlRelaxNGNewValidCtxt(schema);
    py_retval = libxml_xmlRelaxNGValidCtxtPtrWrap((xmlRelaxNGValidCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGParse(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlRelaxNG * c_retval;
    xmlRelaxNGParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlRelaxNGParse", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlRelaxNGParserCtxt *) PyrelaxNgParserCtxt_Get(pyobj_ctxt);

    c_retval = xmlRelaxNGParse(ctxt);
    py_retval = libxml_xmlRelaxNGPtrWrap((xmlRelaxNG *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGValidCtxtClearErrors(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlRelaxNGValidCtxtClearErrors", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);

    xmlRelaxNGValidCtxtClearErrors(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGValidateDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlRelaxNGValidateDoc", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlRelaxNGValidateDoc(ctxt, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGValidateFullElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OOO:xmlRelaxNGValidateFullElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem))
        return(NULL);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlRelaxNGValidateFullElement(ctxt, doc, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGValidatePopElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OOO:xmlRelaxNGValidatePopElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem))
        return(NULL);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlRelaxNGValidatePopElement(ctxt, doc, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGValidatePushCData(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * data;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlRelaxNGValidatePushCData", &pyobj_ctxt, &data, &len))
        return(NULL);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlRelaxNGValidatePushCData(ctxt, data, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxNGValidatePushElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OOO:xmlRelaxNGValidatePushElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem))
        return(NULL);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlRelaxNGValidatePushElement(ctxt, doc, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxParserSetFlag(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int flag;

    if (!PyArg_ParseTuple(args, "Oi:xmlRelaxParserSetFlag", &pyobj_ctxt, &flag))
        return(NULL);
    ctxt = (xmlRelaxNGParserCtxt *) PyrelaxNgParserCtxt_Get(pyobj_ctxt);

    c_retval = xmlRelaxParserSetFlag(ctxt, flag);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlRelaxParserSetIncLImit(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlRelaxNGParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int limit;

    if (!PyArg_ParseTuple(args, "Oi:xmlRelaxParserSetIncLImit", &pyobj_ctxt, &limit))
        return(NULL);
    ctxt = (xmlRelaxNGParserCtxt *) PyrelaxNgParserCtxt_Get(pyobj_ctxt);

    c_retval = xmlRelaxParserSetIncLImit(ctxt, limit);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_RELAXNG_ENABLED) */
PyObject *
libxml_xmlRemoveID(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlAttr * attr;
    PyObject *pyobj_attr;

    if (!PyArg_ParseTuple(args, "OO:xmlRemoveID", &pyobj_doc, &pyobj_attr))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    c_retval = xmlRemoveID(doc, attr);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlRemoveProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlAttr * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlRemoveProp", &pyobj_cur))
        return(NULL);
    cur = (xmlAttr *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlRemoveProp(cur);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlRemoveRef(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlAttr * attr;
    PyObject *pyobj_attr;

    if (libxml_deprecationWarning("xmlRemoveRef") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:xmlRemoveRef", &pyobj_doc, &pyobj_attr))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    c_retval = xmlRemoveRef(doc, attr);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlReplaceNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * old;
    PyObject *pyobj_old;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlReplaceNode", &pyobj_old, &pyobj_cur))
        return(NULL);
    old = (xmlNode *) PyxmlNode_Get(pyobj_old);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlReplaceNode(old, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlResetError(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlError * err;
    PyObject *pyobj_err;

    if (!PyArg_ParseTuple(args, "O:xmlResetError", &pyobj_err))
        return(NULL);
    err = (xmlError *) PyError_Get(pyobj_err);

    xmlResetError(err);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlResetLastError(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    xmlResetLastError();
    Py_INCREF(Py_None);
    return(Py_None);
}

#if defined(LIBXML_SAX1_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSAXDefaultVersion(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int version;

    if (libxml_deprecationWarning("xmlSAXDefaultVersion") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlSAXDefaultVersion", &version))
        return(NULL);

    c_retval = xmlSAXDefaultVersion(version);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SAX1_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlSaveFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "zO:xmlSaveFile", &filename, &pyobj_cur))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlSaveFile(filename, cur);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlSaveFileEnc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    char * encoding;

    if (!PyArg_ParseTuple(args, "zOz:xmlSaveFileEnc", &filename, &pyobj_cur, &encoding))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlSaveFileEnc(filename, cur, encoding);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlSaveFormatFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    int format;

    if (!PyArg_ParseTuple(args, "zOi:xmlSaveFormatFile", &filename, &pyobj_cur, &format))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlSaveFormatFile(filename, cur, format);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
#if defined(LIBXML_OUTPUT_ENABLED)
PyObject *
libxml_xmlSaveFormatFileEnc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    char * filename;
    xmlDoc * cur;
    PyObject *pyobj_cur;
    char * encoding;
    int format;

    if (!PyArg_ParseTuple(args, "zOzi:xmlSaveFormatFileEnc", &filename, &pyobj_cur, &encoding, &format))
        return(NULL);
    cur = (xmlDoc *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlSaveFormatFileEnc(filename, cur, encoding, format);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
PyObject *
libxml_xmlSaveUri(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlURI * uri;
    PyObject *pyobj_uri;

    if (!PyArg_ParseTuple(args, "O:xmlSaveUri", &pyobj_uri))
        return(NULL);
    uri = (xmlURI *) PyURI_Get(pyobj_uri);

    c_retval = xmlSaveUri(uri);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_SCHEMAS_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSchemaCleanupTypes(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlSchemaCleanupTypes") == -1)
        return(NULL);

    xmlSchemaCleanupTypes();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaCollapseString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlSchemaCollapseString", &value))
        return(NULL);

    c_retval = xmlSchemaCollapseString(value);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED) && defined(LIBXML_DEBUG_ENABLED)
PyObject *
libxml_xmlSchemaDump(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    FILE * output;
    PyObject *pyobj_output;
    xmlSchema * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "OO:xmlSchemaDump", &pyobj_output, &pyobj_schema))
        return(NULL);
    output = (FILE *) PyFile_Get(pyobj_output);
    schema = (xmlSchema *) PySchema_Get(pyobj_schema);

    xmlSchemaDump(output, schema);
    PyFile_Release(output);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) && defined(LIBXML_DEBUG_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaFree(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlSchema * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaFree", &pyobj_schema))
        return(NULL);
    schema = (xmlSchema *) PySchema_Get(pyobj_schema);

    xmlSchemaFree(schema);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaFreeParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlSchemaParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaFreeParserCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlSchemaParserCtxt *) PySchemaParserCtxt_Get(pyobj_ctxt);

    xmlSchemaFreeParserCtxt(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSchemaInitTypes(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {
    PyObject *py_retval;
    int c_retval;

    if (libxml_deprecationWarning("xmlSchemaInitTypes") == -1)
        return(NULL);

    c_retval = xmlSchemaInitTypes();
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaIsValid(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaIsValid", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlSchemaIsValid(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaNewDocParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlSchemaParserCtxt * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaNewDocParserCtxt", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlSchemaNewDocParserCtxt(doc);
    py_retval = libxml_xmlSchemaParserCtxtPtrWrap((xmlSchemaParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaNewMemParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlSchemaParserCtxt * c_retval;
    char * buffer;
    int size;

    if (!PyArg_ParseTuple(args, "zi:xmlSchemaNewMemParserCtxt", &buffer, &size))
        return(NULL);

    c_retval = xmlSchemaNewMemParserCtxt(buffer, size);
    py_retval = libxml_xmlSchemaParserCtxtPtrWrap((xmlSchemaParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaNewParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlSchemaParserCtxt * c_retval;
    char * URL;

    if (!PyArg_ParseTuple(args, "z:xmlSchemaNewParserCtxt", &URL))
        return(NULL);

    c_retval = xmlSchemaNewParserCtxt(URL);
    py_retval = libxml_xmlSchemaParserCtxtPtrWrap((xmlSchemaParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaNewValidCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlSchemaValidCtxt * c_retval;
    xmlSchema * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaNewValidCtxt", &pyobj_schema))
        return(NULL);
    schema = (xmlSchema *) PySchema_Get(pyobj_schema);

    c_retval = xmlSchemaNewValidCtxt(schema);
    py_retval = libxml_xmlSchemaValidCtxtPtrWrap((xmlSchemaValidCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaParse(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlSchema * c_retval;
    xmlSchemaParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaParse", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlSchemaParserCtxt *) PySchemaParserCtxt_Get(pyobj_ctxt);

    c_retval = xmlSchemaParse(ctxt);
    py_retval = libxml_xmlSchemaPtrWrap((xmlSchema *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaSetValidOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "Oi:xmlSchemaSetValidOptions", &pyobj_ctxt, &options))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlSchemaSetValidOptions(ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaValidCtxtGetOptions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaValidCtxtGetOptions", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlSchemaValidCtxtGetOptions(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaValidCtxtGetParserCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserCtxt * c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlSchemaValidCtxtGetParserCtxt", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlSchemaValidCtxtGetParserCtxt(ctxt);
    py_retval = libxml_xmlParserCtxtPtrWrap((xmlParserCtxt *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaValidateDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * instance;
    PyObject *pyobj_instance;

    if (!PyArg_ParseTuple(args, "OO:xmlSchemaValidateDoc", &pyobj_ctxt, &pyobj_instance))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);
    instance = (xmlDoc *) PyxmlNode_Get(pyobj_instance);

    c_retval = xmlSchemaValidateDoc(ctxt, instance);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaValidateFile(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * filename;
    int options;

    if (!PyArg_ParseTuple(args, "Ozi:xmlSchemaValidateFile", &pyobj_ctxt, &filename, &options))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlSchemaValidateFile(ctxt, filename, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaValidateOneElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OO:xmlSchemaValidateOneElement", &pyobj_ctxt, &pyobj_elem))
        return(NULL);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlSchemaValidateOneElement(ctxt, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaValidateSetFilename(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlSchemaValidCtxt * vctxt;
    PyObject *pyobj_vctxt;
    char * filename;

    if (!PyArg_ParseTuple(args, "Oz:xmlSchemaValidateSetFilename", &pyobj_vctxt, &filename))
        return(NULL);
    vctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_vctxt);

    xmlSchemaValidateSetFilename(vctxt, filename);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlSchemaWhiteSpaceReplace(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlSchemaWhiteSpaceReplace", &value))
        return(NULL);

    c_retval = xmlSchemaWhiteSpaceReplace(value);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_SCHEMAS_ENABLED) */
PyObject *
libxml_xmlSearchNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNs * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * nameSpace;

    if (!PyArg_ParseTuple(args, "OOz:xmlSearchNs", &pyobj_doc, &pyobj_node, &nameSpace))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlSearchNs(doc, node, nameSpace);
    py_retval = libxml_xmlNsPtrWrap((xmlNs *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlSearchNsByHref(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNs * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * href;

    if (!PyArg_ParseTuple(args, "OOz:xmlSearchNsByHref", &pyobj_doc, &pyobj_node, &href))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlSearchNsByHref(doc, node, href);
    py_retval = libxml_xmlNsPtrWrap((xmlNs *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSetCompressMode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    int mode;

    if (libxml_deprecationWarning("xmlSetCompressMode") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlSetCompressMode", &mode))
        return(NULL);

    xmlSetCompressMode(mode);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlSetDocCompressMode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlDoc * doc;
    PyObject *pyobj_doc;
    int mode;

    if (!PyArg_ParseTuple(args, "Oi:xmlSetDocCompressMode", &pyobj_doc, &mode))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    xmlSetDocCompressMode(doc, mode);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlSetListDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * list;
    PyObject *pyobj_list;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlSetListDoc", &pyobj_list, &pyobj_doc))
        return(NULL);
    list = (xmlNode *) PyxmlNode_Get(pyobj_list);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlSetListDoc(list, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlSetNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNode * node;
    PyObject *pyobj_node;
    xmlNs * ns;
    PyObject *pyobj_ns;

    if (!PyArg_ParseTuple(args, "OO:xmlSetNs", &pyobj_node, &pyobj_ns))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    xmlSetNs(node, ns);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlSetNsProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "OOzz:xmlSetNsProp", &pyobj_node, &pyobj_ns, &name, &value))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlSetNsProp(node, ns, name, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlSetProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlAttr * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "Ozz:xmlSetProp", &pyobj_node, &name, &value))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlSetProp(node, name, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlSetTreeDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * tree;
    PyObject *pyobj_tree;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlSetTreeDoc", &pyobj_tree, &pyobj_doc))
        return(NULL);
    tree = (xmlNode *) PyxmlNode_Get(pyobj_tree);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlSetTreeDoc(tree, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_SAX1_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSetupParserForBuffer(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * buffer;
    char * filename;

    if (libxml_deprecationWarning("xmlSetupParserForBuffer") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Ozz:xmlSetupParserForBuffer", &pyobj_ctxt, &buffer, &filename))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlSetupParserForBuffer(ctxt, buffer, filename);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_SAX1_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSkipBlankChars(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlSkipBlankChars") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlSkipBlankChars", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlSkipBlankChars(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlStopParser(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlStopParser", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    xmlStopParser(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlStrEqual(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * str1;
    xmlChar * str2;

    if (!PyArg_ParseTuple(args, "zz:xmlStrEqual", &str1, &str2))
        return(NULL);

    c_retval = xmlStrEqual(str1, str2);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrQEqual(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * pref;
    xmlChar * name;
    xmlChar * str;

    if (!PyArg_ParseTuple(args, "zzz:xmlStrQEqual", &pref, &name, &str))
        return(NULL);

    c_retval = xmlStrQEqual(pref, name, str);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrcasecmp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * str1;
    xmlChar * str2;

    if (!PyArg_ParseTuple(args, "zz:xmlStrcasecmp", &str1, &str2))
        return(NULL);

    c_retval = xmlStrcasecmp(str1, str2);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrcasestr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlChar * str;
    xmlChar * val;

    if (!PyArg_ParseTuple(args, "zz:xmlStrcasestr", &str, &val))
        return(NULL);

    c_retval = xmlStrcasestr(str, val);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrcat(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * cur;
    xmlChar * add;

    if (!PyArg_ParseTuple(args, "zz:xmlStrcat", &cur, &add))
        return(NULL);

    c_retval = xmlStrcat(cur, add);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrchr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlChar * str;
    xmlChar val;

    if (!PyArg_ParseTuple(args, "zc:xmlStrchr", &str, &val))
        return(NULL);

    c_retval = xmlStrchr(str, val);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrcmp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * str1;
    xmlChar * str2;

    if (!PyArg_ParseTuple(args, "zz:xmlStrcmp", &str1, &str2))
        return(NULL);

    c_retval = xmlStrcmp(str1, str2);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrdup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * cur;

    if (!PyArg_ParseTuple(args, "z:xmlStrdup", &cur))
        return(NULL);

    c_retval = xmlStrdup(cur);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlStringDecodeEntities(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * str;
    int what;
    xmlChar end;
    xmlChar end2;
    xmlChar end3;

    if (libxml_deprecationWarning("xmlStringDecodeEntities") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oziccc:xmlStringDecodeEntities", &pyobj_ctxt, &str, &what, &end, &end2, &end3))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlStringDecodeEntities(ctxt, str, what, end, end2, end3);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlStringGetNodeList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "Oz:xmlStringGetNodeList", &pyobj_doc, &value))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlStringGetNodeList(doc, value);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlStringLenDecodeEntities(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * str;
    int len;
    int what;
    xmlChar end;
    xmlChar end2;
    xmlChar end3;

    if (libxml_deprecationWarning("xmlStringLenDecodeEntities") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Oziiccc:xmlStringLenDecodeEntities", &pyobj_ctxt, &str, &len, &what, &end, &end2, &end3))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlStringLenDecodeEntities(ctxt, str, len, what, end, end2, end3);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlStringLenGetNodeList(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * value;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlStringLenGetNodeList", &pyobj_doc, &value, &len))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlStringLenGetNodeList(doc, value, len);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrlen(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * str;

    if (!PyArg_ParseTuple(args, "z:xmlStrlen", &str))
        return(NULL);

    c_retval = xmlStrlen(str);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrncasecmp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * str1;
    xmlChar * str2;
    int len;

    if (!PyArg_ParseTuple(args, "zzi:xmlStrncasecmp", &str1, &str2, &len))
        return(NULL);

    c_retval = xmlStrncasecmp(str1, str2, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrncat(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * cur;
    xmlChar * add;
    int len;

    if (!PyArg_ParseTuple(args, "zzi:xmlStrncat", &cur, &add, &len))
        return(NULL);

    c_retval = xmlStrncat(cur, add, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrncatNew(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * str1;
    xmlChar * str2;
    int len;

    if (!PyArg_ParseTuple(args, "zzi:xmlStrncatNew", &str1, &str2, &len))
        return(NULL);

    c_retval = xmlStrncatNew(str1, str2, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrncmp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * str1;
    xmlChar * str2;
    int len;

    if (!PyArg_ParseTuple(args, "zzi:xmlStrncmp", &str1, &str2, &len))
        return(NULL);

    c_retval = xmlStrncmp(str1, str2, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrndup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * cur;
    int len;

    if (!PyArg_ParseTuple(args, "zi:xmlStrndup", &cur, &len))
        return(NULL);

    c_retval = xmlStrndup(cur, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrstr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlChar * str;
    xmlChar * val;

    if (!PyArg_ParseTuple(args, "zz:xmlStrstr", &str, &val))
        return(NULL);

    c_retval = xmlStrstr(str, val);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlStrsub(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * str;
    int start;
    int len;

    if (!PyArg_ParseTuple(args, "zii:xmlStrsub", &str, &start, &len))
        return(NULL);

    c_retval = xmlStrsub(str, start, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlSubstituteEntitiesDefault(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int val;

    if (libxml_deprecationWarning("xmlSubstituteEntitiesDefault") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlSubstituteEntitiesDefault", &val))
        return(NULL);

    c_retval = xmlSubstituteEntitiesDefault(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

PyObject *
libxml_xmlSwitchEncodingName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlParserCtxt * ctxt;
    PyObject *pyobj_ctxt;
    char * encoding;

    if (!PyArg_ParseTuple(args, "Oz:xmlSwitchEncodingName", &pyobj_ctxt, &encoding))
        return(NULL);
    ctxt = (xmlParserCtxt *) PyparserCtxt_Get(pyobj_ctxt);

    c_retval = xmlSwitchEncodingName(ctxt, encoding);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlTextConcat(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * content;
    int len;

    if (!PyArg_ParseTuple(args, "Ozi:xmlTextConcat", &pyobj_node, &content, &len))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlTextConcat(node, content, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlTextMerge(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlNode * first;
    PyObject *pyobj_first;
    xmlNode * second;
    PyObject *pyobj_second;

    if (!PyArg_ParseTuple(args, "OO:xmlTextMerge", &pyobj_first, &pyobj_second))
        return(NULL);
    first = (xmlNode *) PyxmlNode_Get(pyobj_first);
    second = (xmlNode *) PyxmlNode_Get(pyobj_second);

    c_retval = xmlTextMerge(first, second);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderAttributeCount(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderAttributeCount", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderAttributeCount(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderByteConsumed(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    long c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderByteConsumed", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderByteConsumed(reader);
    py_retval = libxml_longWrap((long) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderClose(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderClose", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderClose(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstBaseUri(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstBaseUri", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstBaseUri(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstEncoding(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstEncoding", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstEncoding(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstLocalName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstLocalName", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstLocalName(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstName", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstName(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstNamespaceUri(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstNamespaceUri", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstNamespaceUri(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstPrefix(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstPrefix", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstPrefix(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * str;

    if (!PyArg_ParseTuple(args, "Oz:xmlTextReaderConstString", &pyobj_reader, &str))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstString(reader, str);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstValue", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstValue(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstXmlLang(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstXmlLang", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstXmlLang(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderConstXmlVersion(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderConstXmlVersion", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderConstXmlVersion(reader);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderCurrentDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderCurrentDoc", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderCurrentDoc(reader);
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderCurrentNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderCurrentNode", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderCurrentNode(reader);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderDepth(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderDepth", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderDepth(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderExpand(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderExpand", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderExpand(reader);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlTextReaderGetAttribute", &pyobj_reader, &name))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetAttribute(reader, name);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetAttributeNo(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    int no;

    if (!PyArg_ParseTuple(args, "Oi:xmlTextReaderGetAttributeNo", &pyobj_reader, &no))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetAttributeNo(reader, no);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetAttributeNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * localName;
    xmlChar * namespaceURI;

    if (!PyArg_ParseTuple(args, "Ozz:xmlTextReaderGetAttributeNs", &pyobj_reader, &localName, &namespaceURI))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetAttributeNs(reader, localName, namespaceURI);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetLastError(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlError * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderGetLastError", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetLastError(reader);
    py_retval = libxml_xmlErrorPtrWrap((const xmlError *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetParserColumnNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderGetParserColumnNumber", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetParserColumnNumber(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetParserLineNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderGetParserLineNumber", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetParserLineNumber(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetParserProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    int prop;

    if (!PyArg_ParseTuple(args, "Oi:xmlTextReaderGetParserProp", &pyobj_reader, &prop))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetParserProp(reader, prop);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderGetRemainder(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlParserInputBuffer * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderGetRemainder", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderGetRemainder(reader);
    py_retval = libxml_xmlParserInputBufferPtrWrap((xmlParserInputBuffer *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderHasAttributes(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderHasAttributes", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderHasAttributes(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderHasValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderHasValue", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderHasValue(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderIsDefault(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderIsDefault", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderIsDefault(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderIsEmptyElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderIsEmptyElement", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderIsEmptyElement(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderIsNamespaceDecl(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderIsNamespaceDecl", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderIsNamespaceDecl(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderIsValid(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderIsValid", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderIsValid(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderLocatorBaseURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReaderLocatorPtr locator;
    PyObject *pyobj_locator;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderLocatorBaseURI", &pyobj_locator))
        return(NULL);
    locator = (xmlTextReaderLocatorPtr) PyxmlTextReaderLocator_Get(pyobj_locator);

    c_retval = xmlTextReaderLocatorBaseURI(locator);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderLocatorLineNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReaderLocatorPtr locator;
    PyObject *pyobj_locator;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderLocatorLineNumber", &pyobj_locator))
        return(NULL);
    locator = (xmlTextReaderLocatorPtr) PyxmlTextReaderLocator_Get(pyobj_locator);

    c_retval = xmlTextReaderLocatorLineNumber(locator);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderLookupNamespace(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * prefix;

    if (!PyArg_ParseTuple(args, "Oz:xmlTextReaderLookupNamespace", &pyobj_reader, &prefix))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderLookupNamespace(reader, prefix);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderMoveToAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlTextReaderMoveToAttribute", &pyobj_reader, &name))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderMoveToAttribute(reader, name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderMoveToAttributeNo(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    int no;

    if (!PyArg_ParseTuple(args, "Oi:xmlTextReaderMoveToAttributeNo", &pyobj_reader, &no))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderMoveToAttributeNo(reader, no);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderMoveToAttributeNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlChar * localName;
    xmlChar * namespaceURI;

    if (!PyArg_ParseTuple(args, "Ozz:xmlTextReaderMoveToAttributeNs", &pyobj_reader, &localName, &namespaceURI))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderMoveToAttributeNs(reader, localName, namespaceURI);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderMoveToElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderMoveToElement", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderMoveToElement(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderMoveToFirstAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderMoveToFirstAttribute", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderMoveToFirstAttribute(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderMoveToNextAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderMoveToNextAttribute", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderMoveToNextAttribute(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderNext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderNext", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderNext(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderNextSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderNextSibling", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderNextSibling(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderNodeType(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderNodeType", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderNodeType(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderNormalization(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderNormalization", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderNormalization(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderPreserve(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderPreserve", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderPreserve(reader);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderQuoteChar(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderQuoteChar", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderQuoteChar(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderRead(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderRead", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderRead(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderReadAttributeValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderReadAttributeValue", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderReadAttributeValue(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_WRITER_ENABLED)
PyObject *
libxml_xmlTextReaderReadInnerXml(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderReadInnerXml", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderReadInnerXml(reader);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_WRITER_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_WRITER_ENABLED)
PyObject *
libxml_xmlTextReaderReadOuterXml(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderReadOuterXml", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderReadOuterXml(reader);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_WRITER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderReadState(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderReadState", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderReadState(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderReadString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderReadString", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderReadString(reader);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlTextReaderRelaxNGSetSchema(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlRelaxNG * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "OO:xmlTextReaderRelaxNGSetSchema", &pyobj_reader, &pyobj_schema))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);
    schema = (xmlRelaxNG *) PyrelaxNgSchema_Get(pyobj_schema);

    c_retval = xmlTextReaderRelaxNGSetSchema(reader, schema);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlTextReaderRelaxNGValidate(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    char * rng;

    if (!PyArg_ParseTuple(args, "Oz:xmlTextReaderRelaxNGValidate", &pyobj_reader, &rng))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderRelaxNGValidate(reader, rng);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_RELAXNG_ENABLED)
PyObject *
libxml_xmlTextReaderRelaxNGValidateCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlRelaxNGValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "OOi:xmlTextReaderRelaxNGValidateCtxt", &pyobj_reader, &pyobj_ctxt, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);
    ctxt = (xmlRelaxNGValidCtxt *) PyrelaxNgValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlTextReaderRelaxNGValidateCtxt(reader, ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_RELAXNG_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlTextReaderSchemaValidate(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    char * xsd;

    if (!PyArg_ParseTuple(args, "Oz:xmlTextReaderSchemaValidate", &pyobj_reader, &xsd))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderSchemaValidate(reader, xsd);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlTextReaderSchemaValidateCtxt(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlSchemaValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    int options;

    if (!PyArg_ParseTuple(args, "OOi:xmlTextReaderSchemaValidateCtxt", &pyobj_reader, &pyobj_ctxt, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);
    ctxt = (xmlSchemaValidCtxt *) PySchemaValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlTextReaderSchemaValidateCtxt(reader, ctxt, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderSetParserProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    int prop;
    int value;

    if (!PyArg_ParseTuple(args, "Oii:xmlTextReaderSetParserProp", &pyobj_reader, &prop, &value))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderSetParserProp(reader, prop, value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED) && defined(LIBXML_SCHEMAS_ENABLED)
PyObject *
libxml_xmlTextReaderSetSchema(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlSchema * schema;
    PyObject *pyobj_schema;

    if (!PyArg_ParseTuple(args, "OO:xmlTextReaderSetSchema", &pyobj_reader, &pyobj_schema))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);
    schema = (xmlSchema *) PySchema_Get(pyobj_schema);

    c_retval = xmlTextReaderSetSchema(reader, schema);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) && defined(LIBXML_SCHEMAS_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderSetup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;
    xmlParserInputBuffer * input;
    PyObject *pyobj_input;
    char * URL;
    char * encoding;
    int options;

    if (!PyArg_ParseTuple(args, "OOzzi:xmlTextReaderSetup", &pyobj_reader, &pyobj_input, &URL, &encoding, &options))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);
    input = (xmlParserInputBuffer *) PyinputBuffer_Get(pyobj_input);

    c_retval = xmlTextReaderSetup(reader, input, URL, encoding, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
#if defined(LIBXML_READER_ENABLED)
PyObject *
libxml_xmlTextReaderStandalone(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlTextReader * reader;
    PyObject *pyobj_reader;

    if (!PyArg_ParseTuple(args, "O:xmlTextReaderStandalone", &pyobj_reader))
        return(NULL);
    reader = (xmlTextReader *) PyxmlTextReader_Get(pyobj_reader);

    c_retval = xmlTextReaderStandalone(reader);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_READER_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefDoValidityCheckingDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefDoValidityCheckingDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefDoValidityCheckingDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefDoValidityCheckingDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefGetWarningsDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefGetWarningsDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefGetWarningsDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefGetWarningsDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_OUTPUT_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefIndentTreeOutput(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefIndentTreeOutput") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefIndentTreeOutput", &v))
        return(NULL);

    c_retval = xmlThrDefIndentTreeOutput(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefKeepBlanksDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefKeepBlanksDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefKeepBlanksDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefKeepBlanksDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefLineNumbersDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefLineNumbersDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefLineNumbersDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefLineNumbersDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefLoadExtDtdDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefLoadExtDtdDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefLoadExtDtdDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefLoadExtDtdDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefPedanticParserDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefPedanticParserDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefPedanticParserDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefPedanticParserDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_OUTPUT_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefSaveNoEmptyTags(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefSaveNoEmptyTags") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefSaveNoEmptyTags", &v))
        return(NULL);

    c_retval = xmlThrDefSaveNoEmptyTags(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefSubstituteEntitiesDefaultValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    int v;

    if (libxml_deprecationWarning("xmlThrDefSubstituteEntitiesDefaultValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "i:xmlThrDefSubstituteEntitiesDefaultValue", &v))
        return(NULL);

    c_retval = xmlThrDefSubstituteEntitiesDefaultValue(v);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#if defined(LIBXML_OUTPUT_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlThrDefTreeIndentString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    char * v;

    if (libxml_deprecationWarning("xmlThrDefTreeIndentString") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "z:xmlThrDefTreeIndentString", &v))
        return(NULL);

    c_retval = xmlThrDefTreeIndentString(v);
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_OUTPUT_ENABLED) */
PyObject *
libxml_xmlURIEscape(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * str;

    if (!PyArg_ParseTuple(args, "z:xmlURIEscape", &str))
        return(NULL);

    c_retval = xmlURIEscape(str);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIEscapeStr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * str;
    xmlChar * list;

    if (!PyArg_ParseTuple(args, "zz:xmlURIEscapeStr", &str, &list))
        return(NULL);

    c_retval = xmlURIEscapeStr(str, list);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetAuthority(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetAuthority", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->authority;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetFragment(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetFragment", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->fragment;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetOpaque(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetOpaque", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->opaque;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetPath(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetPath", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->path;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetPort(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetPort", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->port;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetQuery(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetQuery", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->query;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetQueryRaw(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetQueryRaw", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->query_raw;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetScheme(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetScheme", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->scheme;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetServer(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetServer", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->server;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURIGetUser(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const char * c_retval;
    xmlURI * URI;
    PyObject *pyobj_URI;

    if (!PyArg_ParseTuple(args, "O:xmlURIGetUser", &pyobj_URI))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    c_retval = URI->user;
    py_retval = libxml_charPtrConstWrap((const char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlURISetAuthority(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * authority;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetAuthority", &pyobj_URI, &authority))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->authority != NULL) xmlFree(URI->authority);
    URI->authority = (char *)xmlStrdup((const xmlChar *)authority);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetFragment(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * fragment;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetFragment", &pyobj_URI, &fragment))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->fragment != NULL) xmlFree(URI->fragment);
    URI->fragment = (char *)xmlStrdup((const xmlChar *)fragment);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetOpaque(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * opaque;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetOpaque", &pyobj_URI, &opaque))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->opaque != NULL) xmlFree(URI->opaque);
    URI->opaque = (char *)xmlStrdup((const xmlChar *)opaque);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetPath(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * path;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetPath", &pyobj_URI, &path))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->path != NULL) xmlFree(URI->path);
    URI->path = (char *)xmlStrdup((const xmlChar *)path);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetPort(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    int port;

    if (!PyArg_ParseTuple(args, "Oi:xmlURISetPort", &pyobj_URI, &port))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    URI->port = port;
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetQuery(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * query;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetQuery", &pyobj_URI, &query))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->query != NULL) xmlFree(URI->query);
    URI->query = (char *)xmlStrdup((const xmlChar *)query);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetQueryRaw(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * query_raw;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetQueryRaw", &pyobj_URI, &query_raw))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->query_raw != NULL) xmlFree(URI->query_raw);
    URI->query_raw = (char *)xmlStrdup((const xmlChar *)query_raw);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetScheme(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * scheme;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetScheme", &pyobj_URI, &scheme))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->scheme != NULL) xmlFree(URI->scheme);
    URI->scheme = (char *)xmlStrdup((const xmlChar *)scheme);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetServer(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * server;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetServer", &pyobj_URI, &server))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->server != NULL) xmlFree(URI->server);
    URI->server = (char *)xmlStrdup((const xmlChar *)server);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURISetUser(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlURI * URI;
    PyObject *pyobj_URI;
    char * user;

    if (!PyArg_ParseTuple(args, "Oz:xmlURISetUser", &pyobj_URI, &user))
        return(NULL);
    URI = (xmlURI *) PyURI_Get(pyobj_URI);

    if (URI->user != NULL) xmlFree(URI->user);
    URI->user = (char *)xmlStrdup((const xmlChar *)user);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlURIUnescapeString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    char * c_retval;
    char * str;
    int len;
    char * target;

    if (!PyArg_ParseTuple(args, "ziz:xmlURIUnescapeString", &str, &len, &target))
        return(NULL);

    c_retval = xmlURIUnescapeString(str, len, target);
    py_retval = libxml_charPtrWrap((char *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Charcmp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * utf1;
    xmlChar * utf2;

    if (!PyArg_ParseTuple(args, "zz:xmlUTF8Charcmp", &utf1, &utf2))
        return(NULL);

    c_retval = xmlUTF8Charcmp(utf1, utf2);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Size(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * utf;

    if (!PyArg_ParseTuple(args, "z:xmlUTF8Size", &utf))
        return(NULL);

    c_retval = xmlUTF8Size(utf);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Strlen(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * utf;

    if (!PyArg_ParseTuple(args, "z:xmlUTF8Strlen", &utf))
        return(NULL);

    c_retval = xmlUTF8Strlen(utf);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Strloc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * utf;
    xmlChar * utfchar;

    if (!PyArg_ParseTuple(args, "zz:xmlUTF8Strloc", &utf, &utfchar))
        return(NULL);

    c_retval = xmlUTF8Strloc(utf, utfchar);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Strndup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * utf;
    int len;

    if (!PyArg_ParseTuple(args, "zi:xmlUTF8Strndup", &utf, &len))
        return(NULL);

    c_retval = xmlUTF8Strndup(utf, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Strpos(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlChar * utf;
    int pos;

    if (!PyArg_ParseTuple(args, "zi:xmlUTF8Strpos", &utf, &pos))
        return(NULL);

    c_retval = xmlUTF8Strpos(utf, pos);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Strsize(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * utf;
    int len;

    if (!PyArg_ParseTuple(args, "zi:xmlUTF8Strsize", &utf, &len))
        return(NULL);

    c_retval = xmlUTF8Strsize(utf, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUTF8Strsub(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlChar * utf;
    int start;
    int len;

    if (!PyArg_ParseTuple(args, "zii:xmlUTF8Strsub", &utf, &start, &len))
        return(NULL);

    c_retval = xmlUTF8Strsub(utf, start, len);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUnlinkNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "O:xmlUnlinkNode", &pyobj_cur))
        return(NULL);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    xmlUnlinkNode(cur);
    Py_INCREF(Py_None);
    return(Py_None);
}

PyObject *
libxml_xmlUnsetNsProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "OOz:xmlUnsetNsProp", &pyobj_node, &pyobj_ns, &name))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlUnsetNsProp(node, ns, name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlUnsetProp(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlUnsetProp", &pyobj_node, &name))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlUnsetProp(node, name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidCtxtNormalizeAttributeValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlChar * name;
    xmlChar * value;

    if (libxml_deprecationWarning("xmlValidCtxtNormalizeAttributeValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOOzz:xmlValidCtxtNormalizeAttributeValue", &pyobj_ctxt, &pyobj_doc, &pyobj_elem, &name, &value))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlValidCtxtNormalizeAttributeValue(ctxt, doc, elem, name, value);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidNormalizeAttributeValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlChar * name;
    xmlChar * value;

    if (libxml_deprecationWarning("xmlValidNormalizeAttributeValue") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOzz:xmlValidNormalizeAttributeValue", &pyobj_doc, &pyobj_elem, &name, &value))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlValidNormalizeAttributeValue(doc, elem, name, value);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateDocument(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlValidateDocument", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlValidateDocument(ctxt, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateDocumentFinal(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (libxml_deprecationWarning("xmlValidateDocumentFinal") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:xmlValidateDocumentFinal", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlValidateDocumentFinal(ctxt, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateDtd(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlDtd * dtd;
    PyObject *pyobj_dtd;

    if (!PyArg_ParseTuple(args, "OOO:xmlValidateDtd", &pyobj_ctxt, &pyobj_doc, &pyobj_dtd))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    dtd = (xmlDtd *) PyxmlNode_Get(pyobj_dtd);

    c_retval = xmlValidateDtd(ctxt, doc, dtd);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateDtdFinal(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (libxml_deprecationWarning("xmlValidateDtdFinal") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:xmlValidateDtdFinal", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlValidateDtdFinal(ctxt, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (!PyArg_ParseTuple(args, "OOO:xmlValidateElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlValidateElement(ctxt, doc, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
PyObject *
libxml_xmlValidateNCName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;
    int space;

    if (!PyArg_ParseTuple(args, "zi:xmlValidateNCName", &value, &space))
        return(NULL);

    c_retval = xmlValidateNCName(value, space);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlValidateNMToken(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;
    int space;

    if (!PyArg_ParseTuple(args, "zi:xmlValidateNMToken", &value, &space))
        return(NULL);

    c_retval = xmlValidateNMToken(value, space);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

PyObject *
libxml_xmlValidateName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;
    int space;

    if (!PyArg_ParseTuple(args, "zi:xmlValidateName", &value, &space))
        return(NULL);

    c_retval = xmlValidateName(value, space);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateNameValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlValidateNameValue", &value))
        return(NULL);

    c_retval = xmlValidateNameValue(value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateNamesValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlValidateNamesValue", &value))
        return(NULL);

    c_retval = xmlValidateNamesValue(value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateNmtokenValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlValidateNmtokenValue", &value))
        return(NULL);

    c_retval = xmlValidateNmtokenValue(value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
PyObject *
libxml_xmlValidateNmtokensValue(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;

    if (!PyArg_ParseTuple(args, "z:xmlValidateNmtokensValue", &value))
        return(NULL);

    c_retval = xmlValidateNmtokensValue(value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateNotationUse(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlChar * notationName;

    if (libxml_deprecationWarning("xmlValidateNotationUse") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOz:xmlValidateNotationUse", &pyobj_ctxt, &pyobj_doc, &notationName))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlValidateNotationUse(ctxt, doc, notationName);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateOneAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlAttr * attr;
    PyObject *pyobj_attr;
    xmlChar * value;

    if (libxml_deprecationWarning("xmlValidateOneAttribute") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOOOz:xmlValidateOneAttribute", &pyobj_ctxt, &pyobj_doc, &pyobj_elem, &pyobj_attr, &value))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);
    attr = (xmlAttr *) PyxmlNode_Get(pyobj_attr);

    c_retval = xmlValidateOneAttribute(ctxt, doc, elem, attr, value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateOneElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;

    if (libxml_deprecationWarning("xmlValidateOneElement") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOO:xmlValidateOneElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlValidateOneElement(ctxt, doc, elem);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateOneNamespace(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlChar * prefix;
    xmlNs * ns;
    PyObject *pyobj_ns;
    xmlChar * value;

    if (libxml_deprecationWarning("xmlValidateOneNamespace") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOOzOz:xmlValidateOneNamespace", &pyobj_ctxt, &pyobj_doc, &pyobj_elem, &prefix, &pyobj_ns, &value))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    c_retval = xmlValidateOneNamespace(ctxt, doc, elem, prefix, ns, value);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_VALID_ENABLED) && defined(LIBXML_REGEXP_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidatePopElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlChar * qname;

    if (libxml_deprecationWarning("xmlValidatePopElement") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOOz:xmlValidatePopElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem, &qname))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlValidatePopElement(ctxt, doc, elem, qname);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) && defined(LIBXML_REGEXP_ENABLED) */
#if defined(LIBXML_VALID_ENABLED) && defined(LIBXML_REGEXP_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidatePushCData(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * data;
    int len;

    if (libxml_deprecationWarning("xmlValidatePushCData") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "Ozi:xmlValidatePushCData", &pyobj_ctxt, &data, &len))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);

    c_retval = xmlValidatePushCData(ctxt, data, len);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) && defined(LIBXML_REGEXP_ENABLED) */
#if defined(LIBXML_VALID_ENABLED) && defined(LIBXML_REGEXP_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidatePushElement(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * elem;
    PyObject *pyobj_elem;
    xmlChar * qname;

    if (libxml_deprecationWarning("xmlValidatePushElement") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOOz:xmlValidatePushElement", &pyobj_ctxt, &pyobj_doc, &pyobj_elem, &qname))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    elem = (xmlNode *) PyxmlNode_Get(pyobj_elem);

    c_retval = xmlValidatePushElement(ctxt, doc, elem, qname);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) && defined(LIBXML_REGEXP_ENABLED) */
PyObject *
libxml_xmlValidateQName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * value;
    int space;

    if (!PyArg_ParseTuple(args, "zi:xmlValidateQName", &value, &space))
        return(NULL);

    c_retval = xmlValidateQName(value, space);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#if defined(LIBXML_VALID_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlValidateRoot(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlValidCtxt * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (libxml_deprecationWarning("xmlValidateRoot") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OO:xmlValidateRoot", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlValidCtxt *) PyValidCtxt_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlValidateRoot(ctxt, doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_VALID_ENABLED) */
#if defined(LIBXML_XINCLUDE_ENABLED)
PyObject *
libxml_xmlXIncludeProcess(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlXIncludeProcess", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlXIncludeProcess(doc);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XINCLUDE_ENABLED) */
#if defined(LIBXML_XINCLUDE_ENABLED)
PyObject *
libxml_xmlXIncludeProcessFlags(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    int flags;

    if (!PyArg_ParseTuple(args, "Oi:xmlXIncludeProcessFlags", &pyobj_doc, &flags))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlXIncludeProcessFlags(doc, flags);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XINCLUDE_ENABLED) */
#if defined(LIBXML_XINCLUDE_ENABLED)
PyObject *
libxml_xmlXIncludeProcessTree(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * tree;
    PyObject *pyobj_tree;

    if (!PyArg_ParseTuple(args, "O:xmlXIncludeProcessTree", &pyobj_tree))
        return(NULL);
    tree = (xmlNode *) PyxmlNode_Get(pyobj_tree);

    c_retval = xmlXIncludeProcessTree(tree);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XINCLUDE_ENABLED) */
#if defined(LIBXML_XINCLUDE_ENABLED)
PyObject *
libxml_xmlXIncludeProcessTreeFlags(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * tree;
    PyObject *pyobj_tree;
    int flags;

    if (!PyArg_ParseTuple(args, "Oi:xmlXIncludeProcessTreeFlags", &pyobj_tree, &flags))
        return(NULL);
    tree = (xmlNode *) PyxmlNode_Get(pyobj_tree);

    c_retval = xmlXIncludeProcessTreeFlags(tree, flags);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XINCLUDE_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathAddValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathAddValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathAddValues(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathBooleanFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathBooleanFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathBooleanFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastBooleanToNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    double c_retval;
    int val;

    if (!PyArg_ParseTuple(args, "i:xmlXPathCastBooleanToNumber", &val))
        return(NULL);

    c_retval = xmlXPathCastBooleanToNumber(val);
    py_retval = libxml_doubleWrap((double) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastBooleanToString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    int val;

    if (!PyArg_ParseTuple(args, "i:xmlXPathCastBooleanToString", &val))
        return(NULL);

    c_retval = xmlXPathCastBooleanToString(val);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastNodeToNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    double c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlXPathCastNodeToNumber", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlXPathCastNodeToNumber(node);
    py_retval = libxml_doubleWrap((double) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastNodeToString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "O:xmlXPathCastNodeToString", &pyobj_node))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    c_retval = xmlXPathCastNodeToString(node);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastNumberToBoolean(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    double val;

    if (!PyArg_ParseTuple(args, "d:xmlXPathCastNumberToBoolean", &val))
        return(NULL);

    c_retval = xmlXPathCastNumberToBoolean(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastNumberToString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    double val;

    if (!PyArg_ParseTuple(args, "d:xmlXPathCastNumberToString", &val))
        return(NULL);

    c_retval = xmlXPathCastNumberToString(val);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastStringToBoolean(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * val;

    if (!PyArg_ParseTuple(args, "z:xmlXPathCastStringToBoolean", &val))
        return(NULL);

    c_retval = xmlXPathCastStringToBoolean(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCastStringToNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    double c_retval;
    xmlChar * val;

    if (!PyArg_ParseTuple(args, "z:xmlXPathCastStringToNumber", &val))
        return(NULL);

    c_retval = xmlXPathCastStringToNumber(val);
    py_retval = libxml_doubleWrap((double) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCeilingFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathCeilingFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathCeilingFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCmpNodes(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlNode * node1;
    PyObject *pyobj_node1;
    xmlNode * node2;
    PyObject *pyobj_node2;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathCmpNodes", &pyobj_node1, &pyobj_node2))
        return(NULL);
    node1 = (xmlNode *) PyxmlNode_Get(pyobj_node1);
    node2 = (xmlNode *) PyxmlNode_Get(pyobj_node2);

    c_retval = xmlXPathCmpNodes(node1, node2);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCompareValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int inf;
    int strict;

    if (!PyArg_ParseTuple(args, "Oii:xmlXPathCompareValues", &pyobj_ctxt, &inf, &strict))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathCompareValues(ctxt, inf, strict);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathConcatFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathConcatFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathConcatFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathContainsFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathContainsFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathContainsFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathContextSetCache(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    int active;
    int value;
    int options;

    if (!PyArg_ParseTuple(args, "Oiii:xmlXPathContextSetCache", &pyobj_ctxt, &active, &value, &options))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathContextSetCache(ctxt, active, value, options);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathCountFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathCountFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathCountFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathDivValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathDivValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathDivValues(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathEqualValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathEqualValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathEqualValues(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathErr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int error;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathErr", &pyobj_ctxt, &error))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathErr(ctxt, error);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathEval(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlChar * str;
    xmlXPathContext * ctx;
    PyObject *pyobj_ctx;

    if (!PyArg_ParseTuple(args, "zO:xmlXPathEval", &str, &pyobj_ctx))
        return(NULL);
    ctx = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctx);

    c_retval = xmlXPathEval(str, ctx);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlXPathEvalExpr(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (libxml_deprecationWarning("xmlXPathEvalExpr") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "O:xmlXPathEvalExpr", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathEvalExpr(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathEvalExpression(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlChar * str;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "zO:xmlXPathEvalExpression", &str, &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathEvalExpression(str, ctxt);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathFalseFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathFalseFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathFalseFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathFloorFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathFloorFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathFloorFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathFreeContext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathFreeContext", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    xmlXPathFreeContext(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathFreeParserContext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathFreeParserContext", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathFreeParserContext(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathGetContextDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlDoc * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathGetContextDoc", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = ctxt->doc;
    py_retval = libxml_xmlDocPtrWrap((xmlDoc *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathGetContextNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathGetContextNode", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = ctxt->node;
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathGetContextPosition(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathGetContextPosition", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = ctxt->proximityPosition;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathGetContextSize(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathGetContextSize", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = ctxt->contextSize;
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathGetFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathGetFunction", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = ctxt->function;
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathGetFunctionURI(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathGetFunctionURI", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = ctxt->functionURI;
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathIdFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathIdFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathIdFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlXPathInit(PyObject *self ATTRIBUTE_UNUSED, PyObject *args ATTRIBUTE_UNUSED) {

    if (libxml_deprecationWarning("xmlXPathInit") == -1)
        return(NULL);

    xmlXPathInit();
    Py_INCREF(Py_None);
    return(Py_None);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathIsInf(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    double val;

    if (!PyArg_ParseTuple(args, "d:xmlXPathIsInf", &val))
        return(NULL);

    c_retval = xmlXPathIsInf(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathIsNaN(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    double val;

    if (!PyArg_ParseTuple(args, "d:xmlXPathIsNaN", &val))
        return(NULL);

    c_retval = xmlXPathIsNaN(val);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathIsNodeType(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "z:xmlXPathIsNodeType", &name))
        return(NULL);

    c_retval = xmlXPathIsNodeType(name);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathLangFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathLangFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathLangFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathLastFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathLastFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathLastFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathLocalNameFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathLocalNameFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathLocalNameFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathModValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathModValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathModValues(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathMultValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathMultValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathMultValues(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNamespaceURIFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathNamespaceURIFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathNamespaceURIFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewBoolean(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    int val;

    if (!PyArg_ParseTuple(args, "i:xmlXPathNewBoolean", &val))
        return(NULL);

    c_retval = xmlXPathNewBoolean(val);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewCString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    char * val;

    if (!PyArg_ParseTuple(args, "z:xmlXPathNewCString", &val))
        return(NULL);

    c_retval = xmlXPathNewCString(val);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewContext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathContext * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlXPathNewContext", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlXPathNewContext(doc);
    py_retval = libxml_xmlXPathContextPtrWrap((xmlXPathContext *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewFloat(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    double val;

    if (!PyArg_ParseTuple(args, "d:xmlXPathNewFloat", &val))
        return(NULL);

    c_retval = xmlXPathNewFloat(val);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewNodeSet(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlNode * val;
    PyObject *pyobj_val;

    if (!PyArg_ParseTuple(args, "O:xmlXPathNewNodeSet", &pyobj_val))
        return(NULL);
    val = (xmlNode *) PyxmlNode_Get(pyobj_val);

    c_retval = xmlXPathNewNodeSet(val);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewParserContext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathParserContext * c_retval;
    xmlChar * str;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "zO:xmlXPathNewParserContext", &str, &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathNewParserContext(str, ctxt);
    py_retval = libxml_xmlXPathParserContextPtrWrap((xmlXPathParserContext *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlChar * val;

    if (!PyArg_ParseTuple(args, "z:xmlXPathNewString", &val))
        return(NULL);

    c_retval = xmlXPathNewString(val);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNewValueTree(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlNode * val;
    PyObject *pyobj_val;

    if (!PyArg_ParseTuple(args, "O:xmlXPathNewValueTree", &pyobj_val))
        return(NULL);
    val = (xmlNode *) PyxmlNode_Get(pyobj_val);

    c_retval = xmlXPathNewValueTree(val);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextAncestor(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextAncestor", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextAncestor(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextAncestorOrSelf(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextAncestorOrSelf", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextAncestorOrSelf(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextAttribute(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextAttribute", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextAttribute(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextChild(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextChild", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextChild(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextDescendant(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextDescendant", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextDescendant(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextDescendantOrSelf(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextDescendantOrSelf", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextDescendantOrSelf(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextFollowing(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextFollowing", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextFollowing(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextFollowingSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextFollowingSibling", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextFollowingSibling(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextNamespace(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextNamespace", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextNamespace(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextParent(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextParent", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextParent(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextPreceding(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextPreceding", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextPreceding(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextPrecedingSibling(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextPrecedingSibling", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextPrecedingSibling(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNextSelf(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlNode * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * cur;
    PyObject *pyobj_cur;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathNextSelf", &pyobj_ctxt, &pyobj_cur))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);
    cur = (xmlNode *) PyxmlNode_Get(pyobj_cur);

    c_retval = xmlXPathNextSelf(ctxt, cur);
    py_retval = libxml_xmlNodePtrWrap((xmlNode *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNodeEval(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlNode * node;
    PyObject *pyobj_node;
    xmlChar * str;
    xmlXPathContext * ctx;
    PyObject *pyobj_ctx;

    if (!PyArg_ParseTuple(args, "OzO:xmlXPathNodeEval", &pyobj_node, &str, &pyobj_ctx))
        return(NULL);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);
    ctx = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctx);

    c_retval = xmlXPathNodeEval(node, str, ctx);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNodeSetFreeNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlNs * ns;
    PyObject *pyobj_ns;

    if (!PyArg_ParseTuple(args, "O:xmlXPathNodeSetFreeNs", &pyobj_ns))
        return(NULL);
    ns = (xmlNs *) PyxmlNode_Get(pyobj_ns);

    xmlXPathNodeSetFreeNs(ns);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNormalizeFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathNormalizeFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathNormalizeFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNotEqualValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathNotEqualValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathNotEqualValues(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNotFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathNotFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathNotFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNsLookup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    const xmlChar * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * prefix;

    if (!PyArg_ParseTuple(args, "Oz:xmlXPathNsLookup", &pyobj_ctxt, &prefix))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathNsLookup(ctxt, prefix);
    py_retval = libxml_xmlCharPtrConstWrap((const xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathNumberFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathNumberFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathNumberFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathOrderDocElems(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    long c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "O:xmlXPathOrderDocElems", &pyobj_doc))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    c_retval = xmlXPathOrderDocElems(doc);
    py_retval = libxml_longWrap((long) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathParseNCName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathParseNCName", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathParseNCName(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathParseName(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathParseName", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathParseName(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathParserGetContext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathContext * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathParserGetContext", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = ctxt->context;
    py_retval = libxml_xmlXPathContextPtrWrap((xmlXPathContext *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathPopBoolean(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathPopBoolean", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathPopBoolean(ctxt);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathPopNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    double c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathPopNumber", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathPopNumber(ctxt);
    py_retval = libxml_doubleWrap((double) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathPopString(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlChar * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathPopString", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathPopString(ctxt);
    py_retval = libxml_xmlCharPtrWrap((xmlChar *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathPositionFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathPositionFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathPositionFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRegisterAllFunctions(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathRegisterAllFunctions", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    xmlXPathRegisterAllFunctions(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRegisterNs(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    int c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * prefix;
    xmlChar * ns_uri;

    if (!PyArg_ParseTuple(args, "Ozz:xmlXPathRegisterNs", &pyobj_ctxt, &prefix, &ns_uri))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathRegisterNs(ctxt, prefix, ns_uri);
    py_retval = libxml_intWrap((int) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
#endif
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRegisteredFuncsCleanup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathRegisteredFuncsCleanup", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    xmlXPathRegisteredFuncsCleanup(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRegisteredNsCleanup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathRegisteredNsCleanup", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    xmlXPathRegisteredNsCleanup(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRegisteredVariablesCleanup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathRegisteredVariablesCleanup", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    xmlXPathRegisteredVariablesCleanup(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRoot(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathRoot", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathRoot(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathRoundFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathRoundFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathRoundFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSetContextDoc(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlDoc * doc;
    PyObject *pyobj_doc;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathSetContextDoc", &pyobj_ctxt, &pyobj_doc))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);

    ctxt->doc = doc;
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSetContextNode(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlNode * node;
    PyObject *pyobj_node;

    if (!PyArg_ParseTuple(args, "OO:xmlXPathSetContextNode", &pyobj_ctxt, &pyobj_node))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);
    node = (xmlNode *) PyxmlNode_Get(pyobj_node);

    ctxt->node = node;
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathStartsWithFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathStartsWithFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathStartsWithFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathStringEvalNumber(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    double c_retval;
    xmlChar * str;

    if (!PyArg_ParseTuple(args, "z:xmlXPathStringEvalNumber", &str))
        return(NULL);

    c_retval = xmlXPathStringEvalNumber(str);
    py_retval = libxml_doubleWrap((double) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathStringFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathStringFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathStringFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathStringLengthFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathStringLengthFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathStringLengthFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSubValues(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathSubValues", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathSubValues(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSubstringAfterFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathSubstringAfterFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathSubstringAfterFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSubstringBeforeFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathSubstringBeforeFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathSubstringBeforeFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSubstringFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathSubstringFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathSubstringFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathSumFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathSumFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathSumFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathTranslateFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathTranslateFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathTranslateFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathTrueFunction(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    int nargs;

    if (!PyArg_ParseTuple(args, "Oi:xmlXPathTrueFunction", &pyobj_ctxt, &nargs))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathTrueFunction(ctxt, nargs);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathValueFlipSign(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathValueFlipSign", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPathValueFlipSign(ctxt);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathValuePop(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;

    if (!PyArg_ParseTuple(args, "O:xmlXPathValuePop", &pyobj_ctxt))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    c_retval = xmlXPathValuePop(ctxt);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathVariableLookup(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * name;

    if (!PyArg_ParseTuple(args, "Oz:xmlXPathVariableLookup", &pyobj_ctxt, &name))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathVariableLookup(ctxt, name);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPathVariableLookupNS(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlXPathContext * ctxt;
    PyObject *pyobj_ctxt;
    xmlChar * name;
    xmlChar * ns_uri;

    if (!PyArg_ParseTuple(args, "Ozz:xmlXPathVariableLookupNS", &pyobj_ctxt, &name, &ns_uri))
        return(NULL);
    ctxt = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctxt);

    c_retval = xmlXPathVariableLookupNS(ctxt, name, ns_uri);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPATH_ENABLED)
PyObject *
libxml_xmlXPatherror(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    xmlXPathParserContext * ctxt;
    PyObject *pyobj_ctxt;
    char * file;
    int line;
    int no;

    if (!PyArg_ParseTuple(args, "Ozii:xmlXPatherror", &pyobj_ctxt, &file, &line, &no))
        return(NULL);
    ctxt = (xmlXPathParserContext *) PyxmlXPathParserContext_Get(pyobj_ctxt);

    xmlXPatherror(ctxt, file, line, no);
    Py_INCREF(Py_None);
    return(Py_None);
}

#endif /* defined(LIBXML_XPATH_ENABLED) */
#if defined(LIBXML_XPTR_ENABLED)
PyObject *
libxml_xmlXPtrEval(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathObject * c_retval;
    xmlChar * str;
    xmlXPathContext * ctx;
    PyObject *pyobj_ctx;

    if (!PyArg_ParseTuple(args, "zO:xmlXPtrEval", &str, &pyobj_ctx))
        return(NULL);
    ctx = (xmlXPathContext *) PyxmlXPathContext_Get(pyobj_ctx);

    c_retval = xmlXPtrEval(str, ctx);
    py_retval = libxml_xmlXPathObjectPtrWrap((xmlXPathObject *) c_retval);
    return(py_retval);
}

#endif /* defined(LIBXML_XPTR_ENABLED) */
#if defined(LIBXML_XPTR_ENABLED)
XML_IGNORE_DEPRECATION_WARNINGS
PyObject *
libxml_xmlXPtrNewContext(PyObject *self ATTRIBUTE_UNUSED, PyObject *args) {
    PyObject *py_retval;
    xmlXPathContext * c_retval;
    xmlDoc * doc;
    PyObject *pyobj_doc;
    xmlNode * here;
    PyObject *pyobj_here;
    xmlNode * origin;
    PyObject *pyobj_origin;

    if (libxml_deprecationWarning("xmlXPtrNewContext") == -1)
        return(NULL);

    if (!PyArg_ParseTuple(args, "OOO:xmlXPtrNewContext", &pyobj_doc, &pyobj_here, &pyobj_origin))
        return(NULL);
    doc = (xmlDoc *) PyxmlNode_Get(pyobj_doc);
    here = (xmlNode *) PyxmlNode_Get(pyobj_here);
    origin = (xmlNode *) PyxmlNode_Get(pyobj_origin);

    c_retval = xmlXPtrNewContext(doc, here, origin);
    py_retval = libxml_xmlXPathContextPtrWrap((xmlXPathContext *) c_retval);
    return(py_retval);
}
XML_POP_WARNINGS

#endif /* defined(LIBXML_XPTR_ENABLED) */
