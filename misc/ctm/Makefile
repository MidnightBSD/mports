PORTNAME=	ctm
PORTVERSION=	2.0
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate, receive and apply FreeBSD source updates per mail
WWW=		https://github.com/freebsd/ctm

LICENSE=	Beerware bsd2
LICENSE_COMB=	multi
LICENSE_NAME_Beerware=	Beerware
LICENSE_TEXT_Beerware=	"THE BEER-WARE LICENSE" (Revision 42): \
		<phk@FreeBSD.org> wrote this file.  As long as you retain this notice you \
		can do whatever you want with this stuff. If we meet some day, and you think \
		this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
LICENSE_PERMS_Beerware=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		tar:txz

USE_GITHUB=	yes
GH_ACCOUNT=	freebsd
GH_TAGNAME=	5b03b48

OPTIONS_DEFINE=	DOCS
MAKE_FLAGS=	MK_MAN=no

do-install:
.for f in ctm ctm_dequeue ctm_rmail ctm_smail
		${INSTALL_PROGRAM} ${WRKSRC}/${f}/${f} \
			${STAGEDIR}${PREFIX}/sbin
.endfor
.for f in ctm ctm_rmail
		${INSTALL_MAN} ${WRKSRC}/${f}/${f}.8 \
			${STAGEDIR}${PREFIX}/share/man/man8/
.endfor
.for f in ctm_dequeue ctm_smail
		${LN} ${STAGEDIR}${PREFIX}/share/man/man8/ctm_rmail.8 \
			${STAGEDIR}${PREFIX}/share/man/man8/${f}.8
.endfor
		${INSTALL_MAN} ${WRKSRC}/ctm/ctm.5 \
			${STAGEDIR}${PREFIX}/share/man/man5/
		${MKDIR} ${STAGEDIR}${DOCSDIR}
		${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>
