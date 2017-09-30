# $MidnightBSD$

PORTNAME=	zssh
PORTVERSION=	1.5c
PORTREVISION=	1
CATEGORIES=	comms security
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/1.5
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactively transferring files to a remote machine while using ssh

LICENSE=	gpl2

RUN_DEPENDS=	lrz:${PORTSDIR}/comms/lrzsz

HAS_CONFIGURE=	yes

PLIST_FILES=	bin/zssh bin/ztelnet \
		man/man1/zssh.1.gz man/man1/ztelnet.1.gz

post-configure:
	@${REINPLACE_CMD} -e 's,^prefix.*,prefix = ${FAKE_DESTDIR}${PREFIX},g' ${WRKSRC}/Makefile

.include <bsd.port.mk>
