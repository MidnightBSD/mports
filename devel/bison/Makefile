# $MidnightBSD: mports/devel/bison/Makefile,v 1.12 2013/06/15 20:01:29 laffer1 Exp $

PORTNAME=	bison
PORTVERSION=	2.7.1
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A parser generator from FSF, (mostly) compatible with Yacc
LICENSE=	gpl3

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_XZ=		yes
USE_CHARSETFIX=	yes
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ARGS+=--disable-yacc

MAN1=		bison.1
INFO=		bison

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-extract:
	@${RM} -f ${WRKSRC}/doc/bison.info*
	@${REINPLACE_CMD} 's/MANS = yacc.1/MANS =/' ${WRKSRC}/doc/Makefile.in
.if ! ${PORT_OPTIONS:MNLS}
	@${REINPLACE_CMD} 's/ install-exec-local//' ${WRKSRC}/lib/Makefile.in
.endif

.if ${PORT_OPTIONS:MEXAMPLES}
PORTEXAMPLES=	calc++

post-install:
	${MKDIR} ${EXAMPLESDIR}/calc++
	${INSTALL_DATA} ${WRKSRC}/examples/calc++/*.[chly]* \
		${EXAMPLESDIR}/calc++
.endif

.include <bsd.port.mk>
