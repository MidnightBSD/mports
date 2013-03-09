# $MidnightBSD: mports/finance/libofx/Makefile,v 1.8 2011/12/15 00:49:53 laffer1 Exp $

PORTNAME=	libofx
PORTVERSION=	0.9.5
CATEGORIES=	finance
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenSource implementation of the OFX (Open Financial eXchange)
LICENSE=        gpl2

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl \
		xml\\+\\+-2.6.2:${PORTSDIR}/textproc/libxml++26 \
		osp.5:${PORTSDIR}/textproc/opensp

USE_GCC=	any
USE_ICONV=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	aclocal autoheader automake autoconf libtool
ACLOCAL_ARGS=	-I m4
CONFIGURE_ARGS=	--disable-doxygen --disable-dot --disable-gengetopt \
		--with-opensp-includes=${LOCALBASE}/include/OpenSP \
		--with-opensp-libs=${LOCALBASE}/lib
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog INSTALL NEWS README totest.txt
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	${TAR} -C ${WRKSRC}/doc -cf - html | \
		${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.mk>
