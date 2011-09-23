# $MidnightBSD: mports/editors/joe/Makefile,v 1.10 2010/04/26 12:58:03 laffer1 Exp $

PORTNAME=	joe
PORTVERSION=	3.7
PORTREVISION=	1
CATEGORIES=	editors
MASTER_SITES=	SF/joe-editor/JOE%20sources/joe-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Joe's Own Editor
LICENSE=	gpl

BUILD_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell

CONFLICTS=	jupp-[0-9]*

USE_GMAKE=	yes
USE_ICONV=	yes
USE_NCURSES=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=${MACHINE_ARCH}-portbld-freebsd6.1
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

ALL_TARGET=	${PORTNAME}
MAN1=		${PORTNAME}.1

MANLANG=	"" ru

.include <bsd.port.pre.mk>

.ifdef NOPORTDOCS
post-patch:
	${REINPLACE_CMD} 's,install-data-am: install-data_charmapsDATA install-data_docDATA,install-data-am: install-data_charmapsDATA,' \
		${WRKSRC}/Makefile.in
.endif

post-install:
	@${CAT} ${FILESDIR}/ftyperc.mbsd >> ${PREFIX}/etc/${PORTNAME}/ftyperc
.for file in jmacsrc jpicorc jstarrc rjoerc joerc
.if !exists(${PREFIX}/etc/${PORTNAME}/${file}.dist)
	@${CP} ${PREFIX}/etc/${PORTNAME}/${file} ${PREFIX}/etc/${PORTNAME}/${file}.dist
.endif
.endfor

.include <bsd.port.post.mk>
