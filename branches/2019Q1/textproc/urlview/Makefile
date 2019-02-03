# $MidnightBSD$

PORTNAME=	urlview
PORTVERSION=	0.9
PORTREVISION=	4
CATEGORIES=	textproc www
MASTER_SITES=	ftp://ftp.mutt.org/mutt/contrib/ \
		ftp://ftp.cs.tu-berlin.de/pub/net/mail/mutt/contrib/ \
		ftp://ftp.fu-berlin.de/pub/unix/mail/mutt/contrib/ \
		ftp://ftp.gbnet.net/pub/mutt-international/contrib/ \
		ftp://ftp.gwdg.de/pub/unix/mail/mutt/international/contrib/ \
		http://seis.bris.ac.uk/~mexas/

#PATCH_SITES=	http://feeding.frenzy.com/~rainking/
#PATCHFILES=	urlview.diff

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	URL extractor/launcher

LICENSE=	gpl2

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e "s,!!PREFIX!!,${PREFIX},g" ${WRKSRC}/url_handler.sh
	@${REINPLACE_CMD} -e \
		"s,/etc/urlview.conf,${PREFIX}/etc/urlview.conf,g" ${WRKSRC}/*

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/url_handler.sh ${PREFIX}/bin

.include <bsd.port.mk>
