import React, { Component } from 'react';

import Header from '../components/header/header';
import UpdateList from '../components/updates/update-list';
import EventList from '../components/events/event-list';
import Related from '../components/related/related';
import SignUp from '../components/forms/signup';

import style from './group.scss';

import queryData from '../util/post-data';

// sample data hosted as json
// const uri = 'https://benvoluto.github.io/ac-sample.json';

// data from graphql api
const query = `{
  group(id: 1) {
    name
    description
    featured_image_url
  }
}`;
const uri = `http://test.advocacycommons.org:3000/queries?query=${query}`;

class Group extends Component {
  constructor(props) {
    super(props);

    this.state = {
      data: {},
      slug: this.props.params.groupSlug,
    };
  }

  componentDidMount() {
    queryData(uri)
      .then((dataResponse) => {
        const groupData = dataResponse;
        if (groupData) {
          this.setState({
            data: groupData.data.group,
          });
        }
      });
  }

  render() {
    const {
        name,
        url,
        updates,
        // city,
        // region,
        contact_name: contactName,
        contact_email: contactEmail,
        contact_phone: contactPhone,
        facebook_page_url: facebookPageUrl,
        featured_image_url: image,
        description,
        // stats,
        // leaders,
        // members,
        events,
        // tags,
        nearby_groups: nearby,
        // loading,
    } = this.state.data;

    const stickyUpdates = (updates) ? updates.sticky : null;
    const regularUpdates = (updates) ? updates.regular : null;

    const signUpFrom = (
      <Related title="Join Our Group">
        <SignUp to={`group-${name}`} />
      </Related>
    );

    const facebookGroup = (
      <Related title={`${name} on Facebook`}>
        <a
          className="facebook-like"
          href={facebookPageUrl}
        >
          Like
        </a>
      </Related>
    );

    const contactWell = (
      <Related title="Contact Info">
        <dl>
          <dt>Group Contact:</dt>
          <dd>{contactName}</dd>
          <dd>{contactPhone}</dd>
          <dd>
            <a href={`mailto:${contactEmail}`}>
              Send us an email
            </a>
          </dd>
        </dl>
      </Related>
    );

    const nearbyWell = (
      <Related title="Nearby Groups">
        {(nearby) ? nearby.map((item, i) => (
          <div key={i}>
            <a href={item.url}>{item.name}</a>
            <span>{item.distance} miles</span>
          </div>
        )) : null }
      </Related>
    );

    return (
      <div className="wrap">
        <Header current="group" />
        <div className="group" style={style}>
          <div className="group-main">
            <a href={url} className="group-title">{name}</a>
            <img
              role="presentation"
              src={image}
              className="group-image"
            />
            <div className="group-description">
              {description}
            </div>
            <UpdateList
              sticky
              updates={stickyUpdates}
            />
            <EventList events={events} />
            <UpdateList
              updates={regularUpdates}
            />
          </div>
          <div className="group-related">
            {signUpFrom}
            {facebookGroup}
            {contactWell}
            {nearbyWell}
          </div>
        </div>
      </div>
    );
  }
}

Group.propTypes = {
  group: React.PropTypes.object,
  params: React.PropTypes.object,
  name: React.PropTypes.string,
  updates: React.PropTypes.object,
};

export default Group;
