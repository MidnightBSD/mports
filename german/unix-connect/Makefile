PORTNAME=	unix-connect
PORTVERSION=	0.95
PORTREVISION=	3
CATEGORIES=	german comms news mail
MASTER_SITES=	ftp://ftp.dinoex.org/pub/unix-connect/ \
		SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail and news gateway for Zconnect
WWW=		https://www.dinoex.de/unix-connect.html

LICENSE=	gpl2 bsd3
LICENSE_COMB=	multi

.if !defined(UC_GATEWAY_HOSTNAME) || !defined(UC_GATEWAY_DOMAIN)
IGNORE=		needs UC_GATEWAY_HOSTNAME and UC_GATEWAY_DOMAIN
.endif

BUILD_DEPENDS=	lrz:comms/lrzsz

USES=		fakeroot gperf

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-user=`id -u -n`
CONFIGURE_ARGS+=--with-group=`id -g -n`
CONFIGURE_ARGS+=--with-execdir=${PREFIX}/libexec/uconnect
CONFIGURE_ARGS+=--with-confdir=${PREFIX}/etc/uconnect
CONFIGURE_ARGS+=--with-spooldir=/var/spool/uconnect
CONFIGURE_ARGS+=--with-sys=${UC_GATEWAY_HOSTNAME}
CONFIGURE_ARGS+=--with-domain=${UC_GATEWAY_DOMAIN}
CONFIGURE_ARGS+=--with-path=/sbin:/bin:/usr/sbin:/usr/bin:${LOCALBASE}/sbin:${LOCALBASE}/bin
CONFIGURE_ARGS+=--enable-testing

CFLAGS+=	-g
CFLAGS:=	${CFLAGS:S/-O[0-9]*//g}	# gcc generates broken code in uwsmtp

WRKSRC=		${WRKDIR}/${DISTNAME}

DOC1=	README INSTALL TODO ChangeLog ChangeLog.configure

OPTIONS_DEFINE=	DOCS
OPTIONS_DEFAULT=SENDMAIL CNEWS
OPTIONS_SINGLE=	MAIL NEWS
OPTIONS_SINGLE_MAIL=	SENDMAIL POSTFIX QMAIL SMAIL NO_MAIL
OPTIONS_SINGLE_NEWS=	CNEWS INN NO_NEWS
NO_OPTIONS_SORT=yes
OPTIONS_SUB=	yes
SENDMAIL_DESC=	build mail scripts for sendmail
POSTFIX_DESC=	build mail scripts for postfix
QMAIL_DESC=	build mail scripts for qmail
SMAIL_DESC=	build mail scripts for smail
NO_MAIL_DESC=	no mail scripts
CNEWS_DESC=	build news scripts for cnews
INN_DESC=	build news scripts for inn
NO_NEWS_DESC=	no news scripts
SENDMAIL_CONFIGURE_ON=	--with-mail=sendmail
POSTFIX_CONFIGURE_ON=	--with-mail=postfix
QMAIL_CONFIGURE_ON=	--with-mail=qmail
SMAIL_CONFIGURE_ON=	--with-mail=smail
NO_MAIL_CONFIGURE_ON=	--with-mail=no
CNEWS_CONFIGURE_ON=	--with-news=cnews
INN_CONFIGURE_ON=	--with-news=inn
NO_NEWS_CONFIGURE_ON=	--with-news=no

pre-install:
	${MKDIR} ${FAKE_DESTDIR}/var/spool

post-install:
	${MV} ${PREFIX}/etc/uconnect/systems.sample.sample \
		${PREFIX}/etc/uconnect/systems.sample

post-install-CNEWS-on:
	${INSTALL_SCRIPT} ${WRKSRC}/mail-and-news/cnews/viazconnect \
		${FAKE_DESTDIR}${PREFIX}/libexec/uconnect/

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOC1:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}/
	${TAR} -C ${WRKSRC}/docs -cf - . | ${TAR} -C ${FAKE_DESTDIR}${DOCSDIR} -xf -

.include <bsd.port.mk>
