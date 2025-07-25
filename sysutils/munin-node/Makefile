PORTNAME=	munin
PORTVERSION=	${MUNIN_VERSION}
PORTREVISION=	3
CATEGORIES=	sysutils perl5
PKGNAMESUFFIX=	-node

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node-specific part of Munin
WWW=		https://munin-monitoring.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	bash:shells/bash \
		p5-Module-Build>=0:devel/p5-Module-Build \
		p5-DateTime-HiRes>=0:devel/p5-DateTime-HiRes \
		p5-Log-Log4perl>=0:devel/p5-Log-Log4perl \
		munin-common>=${MUNIN_VERSION}:sysutils/munin-common \
		p5-Net-Server>=0:net/p5-Net-Server
RUN_DEPENDS=	p5-Cache-Cache>=0:devel/p5-Cache-Cache \
		p5-DateTime-HiRes>=0:devel/p5-DateTime-HiRes \
		p5-Log-Log4perl>=0:devel/p5-Log-Log4perl \
		munin-common>=${MUNIN_VERSION}:sysutils/munin-common \
		p5-Net-Server>=0:net/p5-Net-Server \
		p5-List-MoreUtils>0:lang/p5-List-MoreUtils \
		p5-Net-CIDR>=0:net-mgmt/p5-Net-CIDR \
		p5-libwww>=0:www/p5-libwww \
		bash:shells/bash

EXTRA_PATCHES+=	${MUNIN_PATCHES}
USES=		cpe gmake perl5 shebangfix
PKGMESSAGE=	${WRKDIR}/pkg-message
REINPLACE_ARGS=	-i ""
USE_RC_SUBR=	munin-asyncd munin-node
SHEBANG_FILES=	node/bin/munindoc node/sbin/munin-node \
		node/sbin/munin-node-configure node/sbin/munin-run


.include "${.CURDIR}/../munin-common/munin.mk"

ALL_TARGET=	build-node build-plugins build/node/_bin/munin-async build/node/_bin/munin-asyncd
INSTALL_TARGET=	install-node-prime install-async-prime install-plugins-prime
NO_ARCH=	yes

OPTIONS_DEFINE=	SNMP PERL PYTHON JAVA
OPTIONS_DEFAULT=	SNMP PERL PYTHON
OPTIONS_SUB=	yes
SNMP_DESC=	Include SNMP plugins
PERL_DESC=	Include all Perl modules (adds dependencies)
JAVA_DESC=	Include JAVA plugins
PYTHON_DESC=	Include Python plugins

PYTHON_USES=	python
JAVA_USES=		java
JAVA_INSTALL_TARGET=	install-plugins-java

SUB_FILES=	pkg-message plugins.conf
USE_RC_SUBR=	munin-asyncd munin-node

PORTSCOUT=	ignore:1

PYTHON_USES=	python

PERL_RUN_DEPENDS=	p5-DBD-Pg>=0:databases/p5-DBD-Pg \
		p5-Net-DNS>=0:dns/p5-Net-DNS \
		p5-Net-IP>=0:net-mgmt/p5-Net-IP \
		p5-XML-Parser>=0:textproc/p5-XML-Parser \
		p5-XML-LibXML>=0:textproc/p5-XML-LibXML

SNMP_BUILD_DEPENDS=	p5-Net-SNMP>=0:net-mgmt/p5-Net-SNMP
SNMP_RUN_DEPENDS=	p5-Net-SNMP>=0:net-mgmt/p5-Net-SNMP

bash_CMD=${LOCALBASE}/bin/bash
ruby_CMD=${LOCALBASE}/bin/ruby
java_CMD=${LOCALBASE}/bin/java


post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' \
		${WRKSRC}/node/sbin/munin-node \
		${WRKSRC}/node/sbin/munin-node-configure \
		${WRKSRC}/node/sbin/munin-run
	@${RM}  ${WRKSRC}/node/sbin/munin-node.bak \
		${WRKSRC}/node/sbin/munin-node-configure.bak \
		${WRKSRC}/node/sbin/munin-run.bak
	@${REINPLACE_CMD} \
		-e 's|^\(BASH[[:space:]]*:=\).*|\1 ${bash_CMD}|' \
		-e 's|^\(JAVARUN[[:space:]]*:=\).*|\1 ${java_CMD}|' \
		-e 's|^\(PERL[[:space:]]*:=\).*|\1 ${PERL}|' \
		-e 's|^\(PYTHON[[:space:]]*:=\).*|\1 ${PYTHON_CMD}|' \
		-e 's|^\(RUBY[[:space:]]*:=\).*|\1 ${ruby_CMD}|' \
		${WRKSRC}/Makefile.config
	@${FIND} ${WRKSRC}/node/sbin -type f -name "*.orig" -delete
	${CP} -r ${WRKSRC}/plugins/node.d.freebsd ${WRKSRC}/plugins/node.d.midnightbsd

post-install:
	${MKDIR} ${STAGEDIR}${DBDIR}/plugin-state ${STAGEDIR}${SPOOLDIR}/async
	${INSTALL_SCRIPT} ${.CURDIR}/plugins/* ${STAGEDIR}${DATADIR}/plugins/
	${INSTALL_DATA} ${WRKSRC}/build/node/munin-node.conf \
		${STAGEDIR}${ETCDIR}/munin-node.conf.sample
	${INSTALL_DATA} ${WRKDIR}/plugins.conf \
		${STAGEDIR}${ETCDIR}/plugins.conf.sample
	(cd ${WRKSRC}/node/blib/bindoc; \
		${INSTALL_MAN} munin-node-configure.1 munin-node.1 munin-run.1 ${STAGEDIR}${PREFIX}/share/man/man1; \
	)
	(cd ${WRKSRC}/build/doc; \
		${INSTALL_MAN} munin-node.conf.5 ${STAGEDIR}${PREFIX}/share/man/man5; \
		${INSTALL_MAN} munin.8 ${STAGEDIR}${PREFIX}/share/man/man8; \
	)
	${INSTALL_DATA} ${FILESDIR}/newsyslog ${STAGEDIR}${ETCDIR}/munin-node.newsyslog

.include <bsd.port.mk>
