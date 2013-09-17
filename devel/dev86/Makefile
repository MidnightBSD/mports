# $MidnightBSD$

PORTNAME=	dev86
PORTVERSION=	0.16.17
CATEGORIES=	devel
MASTER_SITES=	http://homepage.ntlworld.com/robert.debath/dev86/
DISTNAME=	Dev86src-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Robert de Bath's 8086 development tools
LICENSE=	gpl2

CONFLICTS=	bcc-[0-9]* \
		bin86-[0-9]*

.include <bsd.port.pre.mk>

MAKE_ENV+= 	DESTDIR=${FAKE_DESTDIR}${TRUE_PREFIX}
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAN1=		as86.1 bcc.1 elks.1 elksemu.1 ld86.1

post-patch:
# Respect CFLAGS in Makefiles.
	@${GREP} -Rl 'CFLAGS=' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -i "" \
	    -Ee "s|CFLAGS='|&${CFLAGS} |; s|^(CFLAGS=)([^'])|\1${CFLAGS} \2|"

do-configure:
	cd ${WRKSRC} && ${MAKE} DESTDIR=${FAKE_DESTDIR} PREFIX=${PREFIX} make.fil

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${FAKE_DESTDIR}${TRUE_PREFIX}/lib/bcc/as86_encap \
		${FAKE_DESTDIR}${TRUE_PREFIX}/bin/bcc

.include <bsd.port.post.mk>
