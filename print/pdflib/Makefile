# $MidnightBSD: mports/print/pdflib/Makefile,v 1.11 2009/09/22 20:54:13 laffer1 Exp $

PORTNAME=	pdflib
PORTVERSION=	7.0.4
CATEGORIES=	print
MASTER_SITES=	http://www.pdflib.com/binaries/PDFlib/${PORTVERSION:S/.//g}/
DISTNAME=	PDFlib-Lite-${PORTVERSION}p4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library for dynamically generating PDF
LICENSE=	restricted

RESTRICTED=	many odd restrictions on usage and distribution

USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-java=no --with-py=no --with-ruby=no --with-tcl=no \
		--enable-shared=yes --enable-static=yes

#FAKE_OPTS=	prefixhack

OPTIONS=	PERL	"Enable Perl bindings"	On

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if defined(WITH_PERL)
USE_PERL5=	yes
PLIST_SUB=	PERL=""
CONFIGURE_ARGS+=--with-perl=${PERL}
PKGNAMESUFFIX=	-perl
.else
CONFIGURE_ARGS+=--with-perl=no
PLIST_SUB=	PERL="@comment "
.endif

.if ${ARCH} == "amd64" || ${ARCH} == "sparc64"
CONFIGURE_ARGS+=--enable-64bit
.endif
post-patch:
	@${REINPLACE_CMD} -e "s|\(PDFLIB_LTCURRENT\)=6|\1=8|g" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's^\$$(top_builddir)/libtool^${LIBTOOL}^' ${WRKSRC}/config/mkcommon.inc.in
	${MKDIR} ${FAKE_DESTDIR}/${SITE_PERL}/${PERL_ARCH}

post-install:
	${MKDIR} ${DATADIR}/fonts
	${INSTALL_DATA} ${WRKSRC}/fonts/* ${DATADIR}/fonts
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/pdflib/* ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
