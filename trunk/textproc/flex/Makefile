# $MidnightBSD$
# $FreeBSD: ports/textproc/flex/Makefile,v 1.4 2008/02/28 13:24:48 sat Exp $

PORTNAME=	flex
PORTVERSION=	2.5.39
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast lexical analyzer generator

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	help2man:${PORTSDIR}/misc/help2man \
		gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USES=		bison gmake libtool makeinfo tar:bzip2
GNU_CONFIGURE=	yes
# install flex header to its own dir to avoid conflict with system flex.
CONFIGURE_ARGS=	--includedir=${PREFIX}/include/flex --disable-shared
CONFIGURE_ENV=	M4=${LOCALBASE}/bin/gm4 MAKEINFO="makeinfo --no-split"
INSTALL_TARGET=	install-strip

INFO=		flex

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext iconv
NLS_CONFIGURE_ENABLE=	nls

post-patch:	.SILENT
	${REINPLACE_CMD} -Ee 's/tests//' \
		-e '/mode=compile ..CC/s/\\$$/-fPIC -DPIC &/' \
		${WRKSRC}/Makefile.in
	${RM} -f ${WRKSRC}/doc/*.info*

.include <bsd.port.mk>
