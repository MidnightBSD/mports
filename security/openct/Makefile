# $MidnightBSD: mports/security/openct/Makefile,v 1.3 2009/09/20 04:08:37 laffer1 Exp $

PORTNAME=	openct
DISTVERSION=	0.6.15
CATEGORIES=	security
MASTER_SITES=	http://www.opensc-project.org/files/${PORTNAME}/ \
		http://www.opensc-project.org/files/${PORTNAME}/testing/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A middleware framework for smart card terminals
LICENSE=	lgpl

OPTIONS=	USB "Install libusb for USB tokens/readers support" on \
		PCSC "Install pcsc-lite to build the PC/SC->OpenCT frontend" off

USE_AUTOTOOLS=	libltdl
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig
USE_LDCONFIG=	yes
USE_RC_SUBR=	openct
SUB_FILES=	etoken.conf

CONFIGURE_ENV=	LTLIB_CFLAGS="-I${LOCALBASE}/include" \
		LTLIB_LIBS="-L${LOCALBASE}/lib -lltdl"

CONFIGURE_ARGS=	--localstatedir=/var

MAN1=		openct-tool.1

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_USB) || exists(${LOCALBASE}/lib/libusb-0.1.so)
LIB_DEPENDS+=	usb-0.1.8:${PORTSDIR}/devel/libusb
.endif

.if defined(WITH_PCSC)
LIB_DEPENDS+=	pcsclite.1:${PORTSDIR}/devel/pcsc-lite
CONFIGURE_ARGS+=--enable-pcsc
PLIST_SUB+=	PCSC=""
.else
PLIST_SUB+=	PCSC="@comment "
.endif

.ifndef(NOPORTDOCS)
CONFIGURE_ARGS+=--enable-doc
.endif

post-patch:
	@${REINPLACE_CMD} 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' \
		${WRKSRC}/configure
.ifndef(NOPORTDOCS)
	@${REINPLACE_CMD} 's|install-data-am: install-apidocDATA install-dist_docDATA|install-data-am: install-dist_docDATA|' \
		${WRKSRC}/doc/Makefile.in
.else
	@${REINPLACE_CMD} 's|install-data-am: install-dist_docDATA|install-data-am:|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} 's|install-data-am: install-apidocDATA install-dist_docDATA|install-data-am:|' \
		${WRKSRC}/doc/Makefile.in
.endif

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA}	${WRKDIR}/etoken.conf ${EXAMPLESDIR}
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
